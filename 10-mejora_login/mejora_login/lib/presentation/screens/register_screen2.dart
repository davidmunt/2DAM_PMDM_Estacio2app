import 'package:flutter/material.dart';
import 'package:mejora_login/presentation/widgets/form_user.dart';
import 'package:mejora_login/infrastructure/models/usuario.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Crear usuario')),
        body: Center(
  child: ElevatedButton(
    onPressed: () async {
      // Mostrar el formulario de usuario en un diálogo
      Usuario? usuario = await showDialog<Usuario?>(
        context: context,
        builder: (BuildContext context) {
          return const AlertDialog(
            title: Text('Registro de Usuario'),
            content: FormUser(),  // Formulario dentro del diálogo
          );
        },
      );

      // Manejar el resultado del formulario
      String mensaje;
      if (usuario != null) {
        mensaje = 'Usuario creado con exito: ${usuario.email}';
      } else {
        mensaje = 'Registro cancelado';
      }

      // Mostrar el resultado en un AlertDialog
      showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Resultado'),
            content: Text(mensaje),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    },
    child: const Text('Registrar Usuario'),
  ),
),
      ),
      // const FormUser()
    );
  }
}