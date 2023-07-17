import 'package:flutter/material.dart';

class MyPopup extends StatelessWidget {
  final String texto;

  const MyPopup({
    super.key,
    required this.texto,
  });
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(texto),
      content: Text('¿Deseas continuar?'),
      actions: [
        TextButton(
          child: Text('Cancelar'),
          onPressed: () {
            Navigator.of(context).pop(
                false); // Cerramos el pop-up y enviamos false como respuesta
          },
        ),
        TextButton(
          child: Text('Aceptar'),
          onPressed: () async {
            Navigator.of(context)
                .pop(true); // Cerramos el pop-up y enviamos true como respuesta
          },
        ),
      ],
    );
  }

  Future<bool?> show(BuildContext context) async {
    return await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return this;
      },
    );
  }
}
