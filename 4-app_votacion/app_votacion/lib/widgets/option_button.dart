import 'package:flutter/material.dart';

class OptionButton extends StatelessWidget {
  final bool isYes;
  final VoidCallback onPressed;

  OptionButton({required this.isYes, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(isYes ? 'Sí' : 'No'),
    );
  }
}
