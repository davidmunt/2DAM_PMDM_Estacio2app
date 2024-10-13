import 'package:flutter/material.dart';

class AlertRespuesta {
  static void mostrar({required BuildContext context, required String respuesta}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Respuesta'),
          content: Text(respuesta),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Lógica adicional si es necesario
              },
              child: const Text('Aceptar'),
            ),
          ],
        );
      },
    );
  }
}
