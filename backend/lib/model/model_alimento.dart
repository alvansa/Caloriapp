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

  //aqui falta poner el email de usuario que lo ingreso
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

  //Aqui falta verificar que el alimento o sea predeterminado o este asociado al usuario
  Future<List<dynamic>?> datos_alimento(int id) async {
    final conn = await establecer_conexion();

    final result = await conn.query('select * from alimento where id_al = $id');

    final data = result.isNotEmpty ? result.expand((row) => row).toList() : [];

    await conn.close();

    return data;
  }

//nombre, tipo, calorias , restriccion.
//Falta ver que los alimentos o sean predeterminados o esten conectadoos al usuario
//Falta ver como lo hacemos con los filtro de tipo y restriccion
  Future<List<List<dynamic>>?> listar_alimentos(
      String nombre, double max_cal) async {
    final conn = await establecer_conexion();

    final result = await conn.query('''select * from alimento 
        where nombre like %@nombre% 
        and calorias <= $max_cal    
        order by nombre desc
        ''', substitutionValues: {'nombre': nombre});

    final data =
        result.isNotEmpty ? result.map((row) => row.toList()).toList() : null;

    await conn.close();

    return data;
  }

//Falta verificar que el alimento o sea predeterminado o este asociado al usuario
//Hay que ver que un usuario no pueda cambiar informacion de un alimento predeterminado
  Future<bool> actualizar_alimento(
      int id_al,
      String nombre,
      int calorias,
      int azucares,
      int proteinas,
      int sodio,
      int grasa_total,
      int h_de_c,
      int colesterol,
      int porcion) async {
    final conn = await establecer_conexion();

    try {
      await conn.query(
          '''update alimento set nombre = @nom, calorias = $calorias, azucares = $azucares, proteinas = $proteinas, sodio = $sodio, grasa_total = $grasa_total, h_de_c = $h_de_c, colesterol = $colesterol, porcion = $porcion where id_al = $id_al''',
          substitutionValues: {'nom': nombre});
      return true;
    } catch (e) {
      print('error en actualizar alimento: $e');
      return false;
    }
  }

  //Teoricamente listo
  Future<List<dynamic>?> pedir_filtro_tipo() async {
    final conn = await establecer_conexion();
    try {
      final result =
          await conn.query('''select nombre tipo from tipo_alimento''');
      final data =
          result.isNotEmpty ? result.map((row) => row.toList()).toList() : null;
      return data;
    } catch (e) {
      print('error en conectar a la base de datos: $e');
      return null;
    }
  }

//Teoricamente listo
  Future<List<dynamic>?> pedir_filtro_restriccion() async {
    final conn = await establecer_conexion();
    try {
      final result =
          await conn.query('''select nombre tipo from restriccion''');
      final data =
          result.isNotEmpty ? result.map((row) => row.toList()).toList() : null;
      return data;
    } catch (e) {
      print('error en conectar a la base de datos: $e');
      return null;
    }
  }
}


/*metodos model alimento
  reg_alimento   ✓✓
  reg_alimento_predeterminado ✓✓
  pedir_filtros_tipo 
  pedir_filtros_restriccion
  listar_alimentos 
  datos_alimento ✓✓ 
  actualizar_alimento ✓✓
  get_lista_alimentos




*/
