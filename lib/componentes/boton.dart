import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class boton_crear extends StatelessWidget {
  final VoidCallback onPressed;

  const boton_crear({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 280,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: Color(0xFF53E88B),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          //padding: EdgeInsets.all(20),
        ),
        child: Container(
          //padding: const EdgeInsets.all(20),
          child: const Center(
              child: Text(
            "Crear",
            style: TextStyle(color: Colors.white),
          )),
        ),
      ),
    );
  }
}
