import 'package:flutter/material.dart';
import 'package:flutter_ejemplo_form/presentation/widgets/form_user.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Crear usuario')),
        body: const FormUser(),
      ),
    );
  }
}