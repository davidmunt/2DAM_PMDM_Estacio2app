import 'package:flutter/material.dart';

class ThemeOptions extends StatefulWidget {
  const ThemeOptions({super.key});

  @override
  State<ThemeOptions> createState() => ThemeOptionsState();
}

class ThemeOptionsState extends State<ThemeOptions> {
  bool darkmode = false;
  int valorSeleccionado = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Seleccionar color del tema"),
        Slider(
          value: valorSeleccionado.toDouble(),
          max: 8,
          divisions: 8,
          label: valorSeleccionado.round().toString(),
          onChanged: (double value) {
            setState(() {
              valorSeleccionado = value.round();
            });
          },
        ),
        ColoredBox(
          color: Colors.black,
          child: Material(
            child: SwitchListTile(
              title: const Text('Modo oscuro'),
              value: darkmode,
              onChanged: (bool? value) {
                setState(() {
                  darkmode = value ?? false;
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}
