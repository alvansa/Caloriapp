import '../model/model_historial_de_consumo.dart';

class con_registrar_consumo {
  Future<bool> con_reg_consumo(
      String fecha, String porcion, String alimento, String email) async {
    //Define la variable de la clase del modelo de historial de consumo
    final historial_de_consumo = model_historial_de_consumo();

    if (porcion.isEmpty || alimento.isEmpty || email.isEmpty) {
      return false;
    }

    int porcion_int = int.parse(porcion);
    int alimento_int = int.parse(alimento);

    return await historial_de_consumo.registrar_consumo(
        fecha, porcion_int, alimento_int, email);
  }
}
