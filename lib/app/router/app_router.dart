import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:bloc_test/features/home/ui/home_screen.dart';
import 'package:bloc_test/features/product/ui/product_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  final List<AutoRoute> routes = [
    AutoRoute(page: HomeRoute.page, path: '/'),
    AutoRoute(page: ProductRoute.page),
  ];
}
