//import 'package:backend/controller/controller_reg_alimento.dart';
//import 'package:backend/controller/con_registrar_consumo.dart';
import 'package:backend/controller/con_historial_consumo.dart';

void main(List<String> arguments) {
  // nombre, calorias, azuccares,proteina, sodio,grasa_total,h_de_c,colesterol
  //ing_alimento_predeterminado(
  //    'platano', '1', '2', '3', '4', '5', '6', '7', '100');

/*
  //Registrar consumo
  final registrar_consumo = con_registrar_consumo();

  bool result;
  //for (int i = 1; i < 10; i++)
  registrar_consumo
      .con_reg_consumo('2023-07-18', '100', '1', 'a@b.com')
      .then((value) {
    result = value;
  });
  */

  final historial_consumo = con_historial_consumo();
  List<List<dynamic>> result;
  historial_consumo.con_lista_historial('a@b.com').then((value) {
    result = value;
    print(result);
  });
}
