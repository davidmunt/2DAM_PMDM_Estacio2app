import 'package:flutter/material.dart';
import 'package:form_user/infrastructure/models/usuario.dart';

enum SingingCharacter { hombre, mujer }

class FormUser extends StatefulWidget {
  const FormUser({super.key});
  @override
  State<FormUser> createState() => _FormExampleState();
}

class _FormExampleState extends State<FormUser> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _edadController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  SingingCharacter? _sexController = SingingCharacter.hombre;

  // Lista de hobbies y su estado (seleccionado o no)
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
  void initState() {
    super.initState();
    _nameController.addListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
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
                //intento convertir el valor a numero para saber si ha introducido un numero
                int? edad = int.tryParse(value);
                if (edad == null) {
                  return 'No has insertado un numero valido en el campo edad';
                }
                if (edad < 18) {
                  return 'Solo podemos registrar usuari@s mayores de edad';
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
                //verifico de una forma un poco basica si ha introducido un correo
                if (!value.contains('@')) {
                  return 'El email tiene que tener un @';
                }
                if (value.startsWith('@') || value.endsWith('@')) {
                  return 'El @ no puede estar al principio o al final del correo';
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
            ElevatedButton(
              onPressed: () {
                setState(() {
                  nombre = _nameController.text;
                  apellido = _lastnameController.text;
                  edad = num.parse(_edadController.text);
                  email = _emailController.text;
                  // Asegurarse de que sexo tiene un valor no nulo
                  sexo = (_sexController == SingingCharacter.hombre) ? 'Hombre' : 'Mujer';
                  // Filtrar las aficiones seleccionadas
                  aficiones = hobbies.entries
                      .where((entry) => entry.value) //filtrar los seleccionados
                      .map((entry) => entry.key) //obtener solo los nombres
                      .toList();
                });
                String mensajeRespuesta = "Se ha creado el usuario con el correo: $email";
                if (!_formKey.currentState!.validate()) {
                  mensajeRespuesta = "Algun campo no es valido";
                }else if (!hobbies.containsValue(true)) {
                  mensajeRespuesta = "Debes seleccionar al menos una aficion";
                }else {
                  Usuario(nombre: nombre, apellidos: apellido, edad: edad, email: email, sexo: sexo!, aficiones: aficiones);
                }
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(mensajeRespuesta)),
                );
              },
              child: const Text('Enviar'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _lastnameController.dispose();
    _edadController.dispose();
    _emailController.dispose();
    super.dispose();
  }
}

