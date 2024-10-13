import 'package:flutter/material.dart';
import 'package:mejora_login/presentation/screens/register_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: RegisterScreen()
    );
  }
}