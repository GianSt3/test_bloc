import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_test/utils/random_strings.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_bloc.freezed.dart';

part 'product_event.dart';

part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(const ProductState.initial()) {
    on<ProductEvent>((event, emit) async {
      await event.when(doSomething: () async {
        String rnd = await Future<String>.delayed(
            const Duration(seconds: 2), () => generateRandomString(8));
        emit(ProductState.loaded(something: rnd));
      });
    });
  }
}
