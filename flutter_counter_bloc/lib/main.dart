import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_counter_bloc/config/theme/app_theme.dart';
import 'package:flutter_counter_bloc/presentation/blocs/counter/counter_bloc.dart';
import 'package:flutter_counter_bloc/presentation/blocs/themes/themes_bloc.dart';
import 'package:flutter_counter_bloc/presentation/blocs/themes/themes_state.dart';
import 'package:flutter_counter_bloc/presentation/screens/counter_home_page_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //envuelvo el MaterialApp con el BlocBuilder para hacer que el ThemeBloc este disponible desde cualquier parte de la app
    //me daba un error por que ThemeOptions no podía encontrar el ThemeBloc en el arbol de widgets
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CounterBloc(),
        ),
        BlocProvider(
          create: (context) => ThemeBloc(),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Counter utilizando Bloc',
            debugShowCheckedModeBanner: false,
            theme: AppTheme(
              isDarkmode: state.darkMode, 
              selectedColor: state.colorTheme,
            ).getTheme(),
            home: const CounterHomePageScreen(),
          );
        },
      ),
    );
  }
}
