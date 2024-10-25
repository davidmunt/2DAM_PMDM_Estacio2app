import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lista_harry_potter_mejorada/presentation/blocs/characters/character_bloc.dart';
import 'package:lista_harry_potter_mejorada/presentation/blocs/login/login_bloc.dart';
import 'package:lista_harry_potter_mejorada/presentation/blocs/themes/themes_bloc.dart';
import 'package:lista_harry_potter_mejorada/presentation/blocs/themes/themes_state.dart';
import 'package:lista_harry_potter_mejorada/config/theme/app_theme.dart';
import 'package:lista_harry_potter_mejorada/config/router/routes.dart';
import 'injection_container.dart' as injection_container;

void main() async {
 await injection_container.init();
 runApp(const MyApp());
}

class MyApp extends StatelessWidget {
 const MyApp({super.key});

 @override
 Widget build(BuildContext context) {
   return MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => injection_container.sl<CharacterBloc>(),
      ),
      BlocProvider(
        create: (context) => injection_container.sl<LoginBloc>(),
      ),
      BlocProvider(
        create: (context) => ThemeBloc(),
      ),
    ],
    child: BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return MaterialApp.router(
          routerConfig: router,
          debugShowCheckedModeBanner: false,
          theme: AppTheme(
            isDarkmode: state.darkMode, 
            selectedColor: state.colorTheme,
          ).getTheme(),
        );
      },
    ),
  );
 }
}
