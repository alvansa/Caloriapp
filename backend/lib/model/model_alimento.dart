// Path: lib\Funciones\view_Registrar_alimento.dart

import 'package:postgres/postgres.dart';

//funcion que recoga los datos de alimento de la bd

class model_alimento {
  Future<PostgreSQLConnection> establecer_conexion() async {
    final connection = PostgreSQLConnection('localhost', 5432, 'caloriapp',
        username: 'postgres', password: 'postgres');
    await connection.open();
    return connection;
  }

  Future<void> reg_alimento(
      String nombre,
      int calorias,
      int proteinas,
      int grasas_totales,
      int hidratos_carbono,
      int azucares,
      int colesterol,
      int sodio,
      int porcion) async {
    final conn = await establecer_conexion();

    try {
      //id_al , nombre , calorias , carbohidratos , proteinas , grasas_totales , hidratos_carbono , azucares , colesterol , sodio
      await conn.query(
          '''insert into alimento (nombre, calorias,azucares,proteina,sodio,grasa_total, h_de_C,colesterol,porcion,predeterminado)
            values (@stringValue, $calorias, $azucares,$proteinas, $sodio, $grasas_totales, $hidratos_carbono,  $colesterol,$porcion,false)''',
          substitutionValues: {'stringValue': nombre});
    } catch (e) {
      print(e);
    } finally {
      await conn.close();
    }
  }

  Future<void> reg_alimento_predeterminado(
      String nombre,
      int calorias,
      int proteinas,
      int grasas_totales,
      int hidratos_carbono,
      int azucares,
      int colesterol,
      int sodio,
      int porcion) async {
    final conn = await establecer_conexion();

    try {
      //id_al , nombre , calorias , carbohidratos , proteinas , grasas_totales , hidratos_carbono , azucares , colesterol , sodio
      await conn.query(
          '''insert into alimento (nombre, calorias,azucares,proteina,sodio,grasa_total, h_de_C,colesterol,porcion,predeterminado)
            values (@stringValue, $calorias, $azucares,$proteinas, $sodio, $grasas_totales, $hidratos_carbono,  $colesterol,$porcion,true)''',
          substitutionValues: {'stringValue': nombre});
    } catch (e) {
      print(e);
    } finally {
      await conn.close();
    }
  }

  Future<List<dynamic>?> datos_alimento(int id) async {
    final conn = await establecer_conexion();

    final result = await conn.query('select * from alimento where id_al = $id');

    final data = result.isNotEmpty ? result.expand((row) => row).toList() : [];

    await conn.close();

    return data;
  }

  Future<List<List<dynamic>>?> listar_alimentos() async {
    final conn = await establecer_conexion();

    final result = await conn.query('select * from alimento');

    //final data =
    //    result.isNotEmpty ? result.map((row) => row.toMap()).toList() : null;

    final data =
        result.isNotEmpty ? result.map((row) => row.toList()).toList() : null;

    await conn.close();

    return data;
  }
}


/*metodos model alimento
  reg_alimento   ✓✓
  reg_alimento_predeterminado ✓✓
  pedir_filtros_tipo 
  pedir_filtros_restriccion
  listar_alimentos ✓✓
  datos_alimento ✓✓
  actualizar_alimento
  get_lista_alimentos




*/
