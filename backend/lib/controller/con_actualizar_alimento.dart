import 'dart:js_interop';

import '../model/model_alimento.dart';

class con_actualizar_alimento {
  Future<List<dynamic>?> nombre_alimento(String id_al) {
    final alimento = model_alimento();
    final id_al_int = int.parse(id_al);
    final reg_alimento = alimento.datos_alimento(id_al_int);

    return reg_alimento;
  }

  Future<bool> actualizar_alimento(
      String id_al,
      String nombre,
      String calorias,
      String azuccares,
      String proteina,
      String sodio,
      String grasa_total,
      String h_de_c,
      String colesterol,
      String porcion) async {
    final alimento = model_alimento();
    final id_al_int = int.parse(id_al);
    final calorias_int = calorias.isNotEmpty ? int.parse(calorias) : 0;
    final azuccares_int = azuccares.isNotEmpty ? int.parse(azuccares) : 0;
    final proteina_int = proteina.isNotEmpty ? int.parse(proteina) : 0;
    final sodio_int = sodio.isNotEmpty ? int.parse(sodio) : 0;
    final grasa_total_int = grasa_total.isNotEmpty ? int.parse(grasa_total) : 0;
    final h_de_c_int = h_de_c.isNotEmpty ? int.parse(h_de_c) : 0;
    final colesterol_int = colesterol.isNotEmpty ? int.parse(colesterol) : 0;
    final porcion_int = porcion.isNotEmpty ? int.parse(porcion) : 0;
    final act_alimento = alimento.actualizar_alimento(
        id_al_int,
        nombre,
        calorias_int,
        azuccares_int,
        proteina_int,
        sodio_int,
        grasa_total_int,
        h_de_c_int,
        colesterol_int,
        porcion_int);

    return act_alimento;
  }
}
