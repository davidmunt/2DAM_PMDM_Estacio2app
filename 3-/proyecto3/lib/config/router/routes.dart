import 'package:flutter/material.dart';
import 'package:go_router.dart';
import 'package:proyecto3/presentation/screens/home_screen.dart';

final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      name:  'home',
      path: '/',
      builder(context: state) => const HomeScreen()
    ),
  ],
);