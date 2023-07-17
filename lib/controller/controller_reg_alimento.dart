import '../model/model_reg_alimento.dart';

Future<String> d_alimento() async {
  var alimento = datos_alimento();
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
    String sodio) async {
  int calorias_int = 0;
  int proteinas_int = 0;
  int grasas_totales_int = 0;
  int hidratos_carbono_int = 0;
  int azucares_int = 0;
  int colesterol_int = 0;
  int sodio_int = 0;
  if (calorias.isNotEmpty) calorias_int = int.parse(calorias);
  if (proteinas.isNotEmpty) proteinas_int = int.parse(proteinas);
  if (grasas_totales.isNotEmpty) grasas_totales_int = int.parse(grasas_totales);
  if (hidratos_carbono.isNotEmpty)
    hidratos_carbono_int = int.parse(hidratos_carbono);
  if (azucares.isNotEmpty) azucares_int = int.parse(azucares);
  if (colesterol.isNotEmpty) colesterol_int = int.parse(colesterol);
  if (sodio.isNotEmpty) sodio_int = int.parse(sodio);

  await ingresar_datos(nombre, calorias_int, proteinas_int, grasas_totales_int,
      hidratos_carbono_int, azucares_int, colesterol_int, sodio_int);
}
