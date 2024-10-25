import 'package:flutter/material.dart';
import 'package:lista_harry_potter_mejorada/domain/entities/character.dart';

class CharacterListWidget extends StatelessWidget {
  final List<Character> characters;

  const CharacterListWidget({super.key, required this.characters});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: characters.length,
      itemBuilder: (context, index) {
        final character = characters[index];
        return ListTile(
          leading: Image.network(character.image),
          title: Text(character.name),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(character.house),
              Text(character.dateOfBirth),
              Text(character.species),
            ],
          ),
          onTap: () {
            showModalBottomSheet<void>(
              context: context,
              builder: (BuildContext context) {
                return SizedBox(
                  height: 200,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text('Personaje: ${character.name}'),
                        Text('Familia: ${character.house}'),
                        Text('Fecha de nacimiento: ${character.dateOfBirth}'),
                        const SizedBox(height: 15),
                        ElevatedButton(
                          child: const Text('Cerrar'),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
