import '../model/model_alimento.dart';

class con_busqueda_alimento {
  Future<List<List<dynamic>>?> busqueda_alimentos(
      String nombre, String max_calorias) async {
    model_alimento alimento1 = model_alimento();
    double max_calorias_float = double.parse(max_calorias);
    Future<List<List<dynamic>>?> alimento =
        alimento1.listar_alimentos(nombre, max_calorias_float);
    return alimento;
  }
}
