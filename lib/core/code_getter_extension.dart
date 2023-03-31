import 'package:bloc_test/core/code_getter.dart';
import 'package:bloc_test/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

extension CodeGetterExtension<B extends Bloc> on BuildContext {
  void test(dynamic Function(String code) event) =>
      read<B>().add(event(getIt<CodeGetter>().code));
}

extension CodeGetterExtensionBloc on Bloc {
  void addLoad(dynamic Function(String code) event) {
    final code = getIt<CodeGetter>().code;
    print('relaunch event with code $code');
    add(event(code));
  }
}
