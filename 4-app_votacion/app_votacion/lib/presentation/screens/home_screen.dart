import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:app_votacion/widgets/option_button.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ejemplo go_router'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OptionButton(isYes: true, onPressed: () => context.go('/yes')),
            OptionButton(isYes: false, onPressed: () => context.go('/no')),
          ],
        ),
      ),
    );
  }
}
