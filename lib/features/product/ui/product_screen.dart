import 'package:auto_route/annotations.dart';
import 'package:bloc_test/features/product/bloc/product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Product'),
        ),
        body: const SafeArea(child: ProductView()),
      ),
    );
  }
}

class ProductView extends StatelessWidget {
  const ProductView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ElevatedButton(
            onPressed: () => context
                .read<ProductBloc>()
                .add(const ProductEvent.doSomething()),
            child: const Text('Load Product!')),
        BlocBuilder<ProductBloc, ProductState>(
            builder: (builder, state) => state.maybeWhen(
                loaded: (data) => Text('From ProductBloc: $data'),
                orElse: () => const Text('empty')))
      ],
    );
  }
}
