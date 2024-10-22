import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lista_harry_potter/presentation/blocs/characters/character_bloc.dart';
import 'package:lista_harry_potter/presentation/blocs/themes/themes_bloc.dart';
import 'package:lista_harry_potter/presentation/blocs/themes/themes_state.dart';
import 'package:lista_harry_potter/presentation/config/theme/app_theme.dart';
import 'package:lista_harry_potter/presentation/screens/characters_screen.dart';
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
        create: (context) => ThemeBloc(),
      ),
    ],
    child: BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme(
            isDarkmode: state.darkMode, 
            selectedColor: state.colorTheme,
          ).getTheme(),
          home: const CharactersScreen(),
        );
      },
    ),
  );
 }
}