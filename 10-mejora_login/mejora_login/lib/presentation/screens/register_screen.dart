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
            child: const Text('Registrate'),
            onPressed: () async {
              Usuario? usuario = await showDialog<Usuario?>(
                context: context,
                builder: (BuildContext context) {
                  return const AlertDialog(
                    title: Text('Registro de Usuario'),
                    content: FormUser(),
                  );
                },
              );
              String mensaje;
              if (usuario != null) {
                mensaje = "Se ha creado el usuario con el email: ${usuario.email}";
              }else{
                mensaje = "Has cancelado la creacion del usuario...";
              }
              return showDialog<void>(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Registro'),
                    content: Text(mensaje),
                    actions: <Widget>[
                      TextButton(
                        //boton para aceptar y salir
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('OK'),
                      ),
                    ],
                  );
                },
              );
            }
          )
        )
      ),
    );
  }
}
