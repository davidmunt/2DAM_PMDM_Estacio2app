import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_counter_bloc/presentation/blocs/counter/counter_bloc.dart';
import 'package:flutter_counter_bloc/presentation/blocs/counter/counter_event.dart';
import 'package:flutter_counter_bloc/presentation/blocs/counter/counter_state.dart';
import 'package:flutter_counter_bloc/presentation/widgets/theme_options.dart';

class CounterDrawerWidget extends StatelessWidget {
  const CounterDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListTile(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 15,
            ),
            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                return Text("Cuenta: ${state.counter}");
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: () {
                context.read<CounterBloc>().add(CounterReset());
              },
              child: const Icon(Icons.refresh)
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Dialog(
                      // ignore: sized_box_for_whitespace
                      child: Container(
                        width: 500,
                        child: AlertDialog(
                          title: const Text("Cambiar tema"),
                          content: const ThemeOptions(),
                          actions: <Widget>[
                            TextButton(
                              child: const Text('Confirmar cambios'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              child: const Text("Cambiar color tema o modo oscuro"),
            ),
          ]
        ),
      ),
    );
  }
}
