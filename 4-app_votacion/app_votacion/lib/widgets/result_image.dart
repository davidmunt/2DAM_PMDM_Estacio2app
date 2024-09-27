import 'package:flutter/material.dart';

class ResultImage extends StatelessWidget {
  final bool isYes;

  const ResultImage({required this.isYes});

  @override
  Widget build(BuildContext context) {
    return Image.asset(isYes ? 'lib/data/images/yes.jpg' : 'lib/data/images/no.jpg',);
  }
}
