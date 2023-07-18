import 'package:flutter/material.dart';
import 'Funciones/view_registrar_alimento.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false, // Elimina el banner de debug
      home: view_registrar_alimento(),
    );
  }
}
