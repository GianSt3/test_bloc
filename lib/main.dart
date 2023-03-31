import 'package:bloc_test/app/bloc/log_bloc_observer.dart';
import 'package:bloc_test/app/router/app_router.dart';
import 'package:bloc_test/core/code_getter.dart';
import 'package:bloc_test/features/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void main() {
  getIt.registerSingleton<CodeGetter>(CodeGetter());
  BlocOverrides.runZoned(
    () => runApp(MyApp()),
    blocObserver: LogBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: BlocListener<HomeBloc, HomeState>(
        listener: (context, state) =>
            state.whenOrNull(loaded: (code) => getIt<CodeGetter>().code = code),
        child: MaterialApp.router(
          routerConfig: _appRouter.config(),
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.orange,
          ),
        ),
      ),
    );
  }
}
