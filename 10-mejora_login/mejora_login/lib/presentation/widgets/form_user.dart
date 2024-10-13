import 'package:flutter/material.dart';
import 'package:mejora_login/infrastructure/models/usuario.dart';

enum SingingCharacter { hombre, mujer }

class FormUser extends StatefulWidget {
  const FormUser({super.key});

  @override
  State<FormUser> createState() => _FormUserState();
}

class _FormUserState extends State<FormUser> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _edadController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  SingingCharacter? _sexController = SingingCharacter.hombre;

  Map<String, bool> hobbies = {
    'Deportes': false,
    'Lectura': false,
    'Cocinar': false,
    'Videojuegos': false,
    'Viajar': false,
  };

  String nombre = "";
  String apellido = "";
  num edad = 0;
  String email = "";
  String? sexo;
  late List<String> aficiones;

  @override
  void dispose() {
    _nameController.dispose();
    _lastnameController.dispose();
    _edadController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox( // Establecer un tamaño fijo
        width: 500, // Ancho fijo
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: 'Nombre'),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'El nombre es obligatorio';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _lastnameController,
                  decoration: const InputDecoration(labelText: 'Apellido'),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'El apellido es obligatorio';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _edadController,
                  decoration: const InputDecoration(labelText: 'Edad'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'La edad es obligatoria';
                    }
                    int? edad = int.tryParse(value);
                    if (edad == null || edad < 18) {
                      return 'La edad debe ser un número mayor o igual a 18';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(labelText: 'Email'),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'El email es obligatorio';
                    }
                    if (!value.contains('@')) {
                      return 'El email debe contener un @';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                ListTile(
                  title: const Text('Hombre'),
                  leading: Radio<SingingCharacter>(
                    value: SingingCharacter.hombre,
                    groupValue: _sexController,
                    onChanged: (SingingCharacter? value) {
                      setState(() {
                        _sexController = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Mujer'),
                  leading: Radio<SingingCharacter>(
                    value: SingingCharacter.mujer,
                    groupValue: _sexController,
                    onChanged: (SingingCharacter? value) {
                      setState(() {
                        _sexController = value;
                      });
                    },
                  ),
                ),
                const Text('Selecciona tus aficiones:'),
                Column(
                  children: hobbies.keys.map((String hobby) {
                    return CheckboxListTile(
                      title: Text(hobby),
                      value: hobbies[hobby],
                      onChanged: (bool? value) {
                        setState(() {
                          hobbies[hobby] = value!;
                        });
                      },
                    );
                  }).toList(),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context, null);
                      },
                      child: const Text('Cancelar'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate() && hobbies.containsValue(true)) {
                          nombre = _nameController.text;
                          apellido = _lastnameController.text;
                          edad = num.parse(_edadController.text);
                          email = _emailController.text;
                          sexo = (_sexController == SingingCharacter.hombre) ? 'Hombre' : 'Mujer';
                          aficiones = hobbies.entries
                              .where((entry) => entry.value)
                              .map((entry) => entry.key)
                              .toList();

                          Usuario usuario = Usuario(
                            nombre: nombre,
                            apellidos: apellido,
                            edad: edad,
                            email: email,
                            sexo: sexo!,
                            aficiones: aficiones,
                          );

                          Navigator.pop(context, usuario);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Formulario incompleto o aficiones no seleccionadas')),
                          );
                        }
                      },
                      child: const Text('Aceptar'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

