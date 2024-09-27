import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // Función para construir un botón con diferentes textos
  Widget buildButton(String text) {
    return TextButton(
      tooltip: 'ir a pantalla',
      onPressed: () {
        debugPrint('$text pulsado');
      },
      child: Text(text),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Inicio'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildButton('1'), // Botón 1
              buildButton('2'), // Botón 2
            ],
          ),
        ),
      ),
    );
  }
}
