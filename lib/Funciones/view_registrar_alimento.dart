import 'package:flutter/material.dart';
import 'package:caloriapp/componentes/Text_field.dart';
import 'package:caloriapp/controller/controller_reg_alimento.dart';
import 'package:caloriapp/componentes/pop_up.dart';
import 'package:logger/logger.dart';

class view_registrar_alimento extends StatefulWidget {
  const view_registrar_alimento({super.key});

  @override
  State<view_registrar_alimento> createState() =>
      _view_registrar_alimentoState();
}

final nombreController = TextEditingController();
final caloriasController = TextEditingController();
final carbohidratosController = TextEditingController();
final proteinasController = TextEditingController();
final grasasTotalesController = TextEditingController();
final hidratosCarbonoController = TextEditingController();
final azucaresController = TextEditingController();
final colesterolController = TextEditingController();
final sodioController = TextEditingController();

class _view_registrar_alimentoState extends State<view_registrar_alimento> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "lib/Imagenes/Pattern.png",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  //logo
                  Container(
                    child: Image.asset(
                      "lib/Imagenes/Caloriapp_logo.png",
                      height: 50,
                      width: 50,
                    ),
                  ),

                  //Titulo Ingresar alimento
                  const Text("Ingresar alimento",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),

                  // Nombre
                  TextFieldsIngreso(
                    hintText: "Nombre",
                    controller: nombreController,
                  ),

                  // Calorias
                  TextFieldsIngreso(
                    hintText: "Calorias",
                    controller: caloriasController,
                  ),

                  // Carbohidratos
                  TextFieldsIngreso(
                    hintText: "Carbohidratos",
                    controller: carbohidratosController,
                  ),

                  // Proteinas
                  TextFieldsIngreso(
                    hintText: "Proteinas",
                    controller: proteinasController,
                  ),

                  // Grasas totales
                  TextFieldsIngreso(
                    hintText: "Grasas totales",
                    controller: grasasTotalesController,
                  ),

                  // H. de carbono disponibles
                  TextFieldsIngreso(
                    hintText: "H. de C. disp",
                    controller: hidratosCarbonoController,
                  ),

                  // Azucares
                  TextFieldsIngreso(
                    hintText: "Azucares",
                    controller: azucaresController,
                  ),

                  //Colesterol
                  TextFieldsIngreso(
                    hintText: "Colesterol",
                    controller: colesterolController,
                  ),

                  //Sodio
                  TextFieldsIngreso(
                    hintText: "Sodio",
                    controller: sodioController,
                  ),

                  const SizedBox(
                    height: 10,
                  ),
                  //Boton de registrar

                  SizedBox(
                    height: 50,
                    width: 280,
                    child: ElevatedButton(
                      onPressed: () async {
                        ing_alimento(
                          nombreController.text, //nombre
                          caloriasController.text, //calorias
                          proteinasController.text, //proteinas
                          grasasTotalesController.text, //grasas totales
                          hidratosCarbonoController.text, //hidratos de carbono
                          azucaresController.text, //azucares
                          colesterolController.text, //colesterol
                          sodioController.text, //sodio
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF53E88B),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                      ),
                      child: Container(
                        child: const Center(
                            child: Text(
                          "Crear",
                          style: TextStyle(color: Colors.white),
                        )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
