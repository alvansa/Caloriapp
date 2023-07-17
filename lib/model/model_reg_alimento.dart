// Path: lib\Funciones\view_Registrar_alimento.dart

import 'package:postgres/postgres.dart';

//funcion que recoga los datos de alimento de la bd
Future<PostgreSQLConnection> establecer_conexion() async {
  final connection = PostgreSQLConnection('192.168.56.1', 5432, 'caloriapp',
      username: 'postgres', password: '1234');
  await connection.open();
  return connection;
}

Future<void> ingresar_datos(
    String nombre,
    int calorias,
    int proteinas,
    int grasas_totales,
    int hidratos_carbono,
    int azucares,
    int colesterol,
    int sodio) async {
  final conn = await establecer_conexion();

  try {
    //id_al , nombre , calorias , carbohidratos , proteinas , grasas_totales , hidratos_carbono , azucares , colesterol , sodio
    await conn.query(
        '''insert into alimento (nombre, calorias,azucares,proteina,sodio,grasa_total, h_de_C,colesterol)
            values (@stringValue, $calorias, $azucares,$proteinas, $sodio, $grasas_totales, $hidratos_carbono,  $colesterol)''',
        substitutionValues: {'stringValue': nombre});
  } catch (e) {
    print(e);
  } finally {
    await conn.close();
  }
}

Future<String> datos_alimento() async {
  final conn = await establecer_conexion();

  try {
    final result = await conn.query('select * from alimento where id_al = 1');

    late String nombre_alimento = '';

    if (result.isEmpty) {
      nombre_alimento = 'fallo';
      return nombre_alimento;
    }

    for (final row in result) {
      nombre_alimento = row[1];
    }

    return nombre_alimento;
  } catch (e) {
    return 'fallo';
  } finally {
    await conn.close();
  }
}
