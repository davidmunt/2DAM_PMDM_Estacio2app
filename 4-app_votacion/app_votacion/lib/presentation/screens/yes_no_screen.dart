import 'package:flutter/material.dart';
import 'package:app_votacion/widgets/result_image.dart';

class YesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Has votado'),
        centerTitle: true,
      ),
      body: Center(
        child: ResultImage(isYes: true),
      ),
    );
  }
}

class NoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Has votado'),
        centerTitle: true,
      ),
      body: Center(
        child: ResultImage(isYes: false),
      ),
    );
  }
}
