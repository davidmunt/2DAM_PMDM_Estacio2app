import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:app_votacion/presentation/screens/home_screen.dart';
import 'package:app_votacion/presentation/screens/yes_no_screen.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => HomeScreen(),
    ),
    GoRoute(
      path: 'yes',
      builder: (context, state) => YesScreen(),
    ),
    GoRoute(
      path: 'no',
      builder: (context, state) => NoScreen(),
    ),
  ],
);
