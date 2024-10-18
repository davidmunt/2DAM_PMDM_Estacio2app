import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_counter_bloc/presentation/blocs/themes/themes_bloc.dart';
import 'package:flutter_counter_bloc/presentation/blocs/themes/themes_event.dart';

class ThemeOptions extends StatefulWidget {
  const ThemeOptions({super.key});

  @override
  State<ThemeOptions> createState() => _ThemeOptionsState();
}

class _ThemeOptionsState extends State<ThemeOptions> {
  bool darkmode = false;
  int valorSeleccionado = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Funciona"),
        Slider(
          value: valorSeleccionado.toDouble(),
          max: 8,
          divisions: 8,
          label: valorSeleccionado.round().toString(),
          onChanged: (double value) {
            setState(() {
              valorSeleccionado = value.round();
            });
            context.read<ThemeBloc>().add(ThemeChanged(valorSeleccionado, darkmode));
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
                context.read<ThemeBloc>().add(ThemeChanged(valorSeleccionado, darkmode));
              },
            ),
          ),
        ),
      ],
    );
  }
}
