import 'package:flutter/material.dart';
//import 'package:flutter_ejemplo_form/infrastructure/models/usuario.dart';

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
  String nombre = "david";

  @override
  void initState() {
    super.initState();
    _nameController.addListener((){
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      //Asociamos la clave al formulario
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextFormField(
                controller: _nameController,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'El nombre es obligatorio';
                    }
                    return null;
                  }),
              TextFormField(
                controller: _lastnameController,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'El apellido es obligatorio';
                    }
                    return null;
                  }),
              TextFormField(
                controller: _edadController,
                decoration: const InputDecoration(labelText: 'Edad'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  // Validar que el campo no esté vacío
                  if (value == null || value.isEmpty) {
                    return 'La edad es obligatoria';
                  }
                  int? edad = int.tryParse(value);
                  if (edad! < 18) {
                    return 'Debes ser mayor de 18 años';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    nombre = _nameController.text;
                  });
                  String mensajeRespuesta = "Se ha creado el usuarion con el correo: ${nombre}";
                  if (!_formKey.currentState!.validate()) {
                    mensajeRespuesta = "Algun campo no es valido";
                  }
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(mensajeRespuesta)),
                  );
                },
                child: const Text('Enviar'),
              ),
            ]
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Eliminar el controlador cuando el widget desaparece
    _nameController.dispose();
    super.dispose();
  }
}
