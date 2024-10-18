import 'package:counterblock/presentation/widget/countebuttonwidget.dart';
import 'package:flutter/material.dart';

class Counter extends StatelessWidget {
  const Counter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Total transacciones: 0"),
        actions: [
          TextButton(onPressed: (){}, child: const Icon(Icons.refresh))
        ],
      ),
      body: const Center(
        child: Text("Cuenta: 0"),
      ),
      floatingActionButton: const CounterWindget(),
    );
  }
}