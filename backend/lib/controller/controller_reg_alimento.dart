import '../model/model_alimento.dart';

Future<List<dynamic>?> con_datos_alimento(String id) async {
  model_alimento alimento1 = model_alimento();
  int id_int = id.isNotEmpty ? int.parse(id) : 0;

  Future<List<dynamic>?> alimento = alimento1.datos_alimento(id_int);
  return alimento;
}

Future<List<List<dynamic>>?> cont_listar_alimentos() async {
  model_alimento alimento1 = model_alimento();
  Future<List<List<dynamic>>?> alimento = alimento1.listar_alimentos();
  return alimento;
}

Future<void> ing_alimento(
    String nombre,
    String calorias,
    String proteinas,
    String grasas_totales,
    String hidratos_carbono,
    String azucares,
    String colesterol,
    String sodio,
    String porcion) async {
  model_alimento reg_alimento1 = model_alimento();
  int calorias_int = 0;
  int proteinas_int = 0;
  int grasas_totales_int = 0;
  int hidratos_carbono_int = 0;
  int azucares_int = 0;
  int colesterol_int = 0;
  int sodio_int = 0;
  int porcion_int = 0;
  if (calorias.isNotEmpty) calorias_int = int.parse(calorias);
  if (proteinas.isNotEmpty) proteinas_int = int.parse(proteinas);
  if (grasas_totales.isNotEmpty) grasas_totales_int = int.parse(grasas_totales);
  if (hidratos_carbono.isNotEmpty)
    hidratos_carbono_int = int.parse(hidratos_carbono);
  if (azucares.isNotEmpty) azucares_int = int.parse(azucares);
  if (colesterol.isNotEmpty) colesterol_int = int.parse(colesterol);
  if (sodio.isNotEmpty) sodio_int = int.parse(sodio);
  if (porcion.isNotEmpty) porcion_int = int.parse(porcion);

  await reg_alimento1.reg_alimento(
      nombre,
      calorias_int,
      proteinas_int,
      grasas_totales_int,
      hidratos_carbono_int,
      azucares_int,
      colesterol_int,
      sodio_int,
      porcion_int);
}

Future<void> ing_alimento_predeterminado(
    String nombre,
    String calorias,
    String proteinas,
    String grasas_totales,
    String hidratos_carbono,
    String azucares,
    String colesterol,
    String sodio,
    String porcion) async {
  model_alimento reg_alimento1 = model_alimento();
  int calorias_int = 0;
  int proteinas_int = 0;
  int grasas_totales_int = 0;
  int hidratos_carbono_int = 0;
  int azucares_int = 0;
  int colesterol_int = 0;
  int sodio_int = 0;
  int porcion_int = 0;
  if (calorias.isNotEmpty) calorias_int = int.parse(calorias);
  if (proteinas.isNotEmpty) proteinas_int = int.parse(proteinas);
  if (grasas_totales.isNotEmpty) grasas_totales_int = int.parse(grasas_totales);
  if (hidratos_carbono.isNotEmpty)
    hidratos_carbono_int = int.parse(hidratos_carbono);
  if (azucares.isNotEmpty) azucares_int = int.parse(azucares);
  if (colesterol.isNotEmpty) colesterol_int = int.parse(colesterol);
  if (sodio.isNotEmpty) sodio_int = int.parse(sodio);
  if (porcion.isNotEmpty) porcion_int = int.parse(porcion);

  await reg_alimento1.reg_alimento_predeterminado(
      nombre,
      calorias_int,
      proteinas_int,
      grasas_totales_int,
      hidratos_carbono_int,
      azucares_int,
      colesterol_int,
      sodio_int,
      porcion_int);
}
