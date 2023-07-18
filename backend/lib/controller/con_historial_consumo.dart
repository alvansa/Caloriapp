import '../model/model_historial_de_consumo.dart';

class con_historial_consumo {
  Future<List<List<dynamic>>> con_lista_historial(String email) async {
    //Define la variable de la clase del modelo de historial de consumo
    final historial_de_consumo = model_historial_de_consumo();

    return await historial_de_consumo.lista_historial(email);
  }
}
