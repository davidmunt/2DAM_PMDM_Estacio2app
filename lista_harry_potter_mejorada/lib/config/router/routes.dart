import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lista_harry_potter_mejorada/domain/repositories/login_repository.dart';
import 'package:lista_harry_potter_mejorada/presentation/blocs/characters/character_bloc.dart';
import 'package:lista_harry_potter_mejorada/presentation/blocs/login/login_bloc.dart';
import 'package:lista_harry_potter_mejorada/presentation/screens/login_screen.dart';
import 'package:lista_harry_potter_mejorada/presentation/screens/characters_screen.dart';
import 'package:lista_harry_potter_mejorada/injection_container.dart'
   as di;

final GoRouter router = GoRouter(
 initialLocation: '/home',
 routes: [
   GoRoute(
     path: '/login',
     builder: (context, state) => BlocProvider(
       create: (context) => di.sl<LoginBloc>(),
       child: const LoginScreen(),
     ),
   ),
   GoRoute(
     path: '/home',
     builder: (context, state) => MultiBlocProvider(
       providers: [
         BlocProvider<CharacterBloc>(
           create: (BuildContext context) => di.sl<CharacterBloc>(),
         ),
         BlocProvider<LoginBloc>(
           create: (BuildContext context) => di.sl<LoginBloc>(),
         ),
       ],
       child: const CharactersScreen(),
     ),
   ),
 ],
 redirect: (context, state) async {
   final isLoggedIn = await di.sl<LoginRepository>().isLoggedIn();
   return isLoggedIn.fold((_) => '/login', (loggedIn) {
     if (!loggedIn && !state.matchedLocation.contains("/login")) {
       return "/login";
     } else {
       return state.matchedLocation;
     }
   });
 },
);