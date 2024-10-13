import 'package:flutter/material.dart';
import 'package:mejora_robot/presentation/widgets/form_gen_robot.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Generador de robots')),
        body: const FormGenRobot(),
      ),
    );
  }
}