import 'package:backend/controller/controller_reg_alimento.dart';

void main(List<String> arguments) {
  // nombre, calorias, azuccares,proteina, sodio,grasa_total,h_de_c,colesterol
  //ing_alimento_predeterminado(
  //    'mandarina', '1', '2', '3', '4', '5', '6', '7', '100');
  cont_listar_alimentos().then((datos) {
    print(datos);
  });
}
