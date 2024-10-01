import 'package:flutter/material.dart';
import 'package:flutter_ejemplo_gestion_tema/config/theme/app_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int valorSeleccionado = 0;
  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme(selectedColor: valorSeleccionado, isDarkmode: false);
    return MaterialApp(
      theme: appTheme.getTheme(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Ejemplo con ThemeData",
            textDirection: TextDirection.ltr,
          ),
        ),
        body: Center(
          child: 
          Slider(
        value: valorSeleccionado.toDouble(),
        max: 8,
        divisions: 8,
        label: valorSeleccionado.round().toString(),
        onChanged: (double value) {
          setState(() {
            valorSeleccionado = value.round();
            appTheme.selectedColor = valorSeleccionado;
          });
        },
      ),
              // Text('Hello World!',
              // style: Theme.of(context).textTheme.displayLarge),
        ),
      ),
    );
  }
}


