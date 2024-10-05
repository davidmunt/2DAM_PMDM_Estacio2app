import 'package:flutter/material.dart';

class FormGenRobot extends StatefulWidget {
  const FormGenRobot({super.key});

  @override
  State<FormGenRobot> createState() => _FormExampleState();
}

class _FormExampleState extends State<FormGenRobot> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
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
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    nombre = _nameController.text;
                  });
                  String mensajeRespuesta = "Robot actualizado con el nombre ${nombre}";
                  if (!_formKey.currentState!.validate()) {
                    mensajeRespuesta = "Algún campo no es válido";
                  }
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(mensajeRespuesta)),
                  );
                },
                child: const Text('Generar robot'),
              ),
              Center(
                child: Image(
                  image: NetworkImage("https://robohash.org/${nombre}"),
                ),
              )
            ]),
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
