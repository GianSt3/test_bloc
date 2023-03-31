import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_test/utils/random_strings.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_bloc.freezed.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState.initial()) {
    on<HomeEvent>((event, emit) async {
      await event.when(doSomething: () async {
        String rnd = await Future<String>.delayed(
            const Duration(milliseconds: 100), () => generateRandomString(8));
        emit(HomeState.loaded(something: rnd));
      });
    });
  }
}
