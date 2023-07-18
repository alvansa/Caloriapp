import 'dart:js_interop';

import '../model/model_alimento.dart';

class con_actualizar_alimento {
  Future<List<dynamic>?> nombre_alimento(String id_al) {
    final alimento = model_alimento();
    final id_al_int = int.parse(id_al);
    final reg_alimento = alimento.datos_alimento(id_al_int);

    return reg_alimento;
  }
}
