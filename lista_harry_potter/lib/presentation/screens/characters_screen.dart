import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lista_harry_potter/presentation/blocs/characters/character_bloc.dart';
import 'package:lista_harry_potter/presentation/blocs/characters/character_event.dart';
import 'package:lista_harry_potter/presentation/blocs/characters/character_state.dart';
import 'package:lista_harry_potter/presentation/blocs/themes/themes_bloc.dart';
import 'package:lista_harry_potter/presentation/blocs/themes/themes_event.dart';
import 'package:lista_harry_potter/presentation/widgets/list_characters_widget.dart';
import 'package:lista_harry_potter/presentation/widgets/theme_options.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharactersScreen> {
  String _filter = '';
  int countCharacters = 0;
  
  final GlobalKey<ThemeOptionsState> themeOptionsKey = GlobalKey<ThemeOptionsState>();

  @override
  void initState() {
    super.initState();
    context.read<CharacterBloc>().add(LoadCharactersEvent(_filter));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Personajes de Harry Potter')),
      drawer: Drawer(
        child: ListTile(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              TextButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Dialog(
                        child: SizedBox(
                          width: 500,
                          child: AlertDialog(
                            title: const Text("Cambiar tema"),
                            content: ThemeOptions(key: themeOptionsKey),
                            actions: <Widget>[
                              TextButton(
                                child: const Text('Cancelar'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              TextButton(
                                child: const Text('Confirmar cambios'),
                                onPressed: () {
                                  final themeOptionsState = themeOptionsKey.currentState;
                                  context.read<ThemeBloc>().add(ThemeChanged(themeOptionsState!.valorSeleccionado, themeOptionsState.darkmode));
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
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Column(
            children: [
              Text("Numero de personajes: $countCharacters"),
              const SizedBox(height: 15),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        _filter = value;
                      });
                    },
                    decoration: const InputDecoration(
                      labelText: 'Filtrar por nombre',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                FloatingActionButton(
                  onPressed: () {
                    context
                        .read<CharacterBloc>()
                        .add(LoadCharactersEvent(_filter));
                  },
                  child: const Icon(Icons.search),
                ),
              ],
            ),
          ),
          Expanded(
            child: BlocBuilder<CharacterBloc, CharacterState>(
              builder: (context, state) {
                if (state.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state.errorMessage.isNotEmpty) {
                  return Center(child: Text(state.errorMessage));
                } else if (state.characters.isNotEmpty) {
                  countCharacters = state.characters.length;
                  return CharacterListWidget(
                    characters: state.characters,
                  );
                } else {
                  countCharacters = 0;
                  return const Center(
                    child: Text('No hay personajes que coincidan con el filtro.'),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
