import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:listado_de_productos/presentation/screens/screens.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return HomeScreen();
        }),
    GoRoute(
        path: '/producto/:id',
        builder: (BuildContext context, GoRouterState state) {
        final productId = state.pathParameters['id'];
        return Producto(productId: productId!);
  }
)
  ],
);