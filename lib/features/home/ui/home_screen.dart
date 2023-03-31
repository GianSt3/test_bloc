import 'package:auto_route/auto_route.dart';
import 'package:bloc_test/app/router/app_router.dart';
import 'package:bloc_test/features/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: const SafeArea(child: HomeView()),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ElevatedButton(
            onPressed: () => context.router.push(const ProductRoute()),
            child: const Text('Go Product')),
        ElevatedButton(
            onPressed: () =>
                context.read<HomeBloc>().add(const HomeEvent.doSomething()),
            child: const Text('Load!')),
        BlocBuilder<HomeBloc, HomeState>(
            builder: (builder, state) => state.maybeWhen(
                loaded: (data) => Text('From HomeBloc: $data'),
                orElse: () => const Text('empty')))
      ],
    );
  }
}
