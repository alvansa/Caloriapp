import 'package:postgres/postgres.dart';

//En general falta ver si hacemos un registro predeterminado y otro para el usuario

class model_alimento_compuesto {
  Future<PostgreSQLConnection> establecer_conexion() async {
    final connection = PostgreSQLConnection('localhost', 5432, 'caloriapp',
        username: 'postgres', password: 'postgres');
    await connection.open();
    return connection;
  }

  Future<bool> reg_al_comp_nombre(String nombre) async {
    final conn = await establecer_conexion();
    try {
      await conn.query(
          '''insert into alimento_compuesto (nombre) values (@nombre)''',
          substitutionValues: {'nombre': nombre});
      return true;
    } catch (e) {
      print('error en registrar alimento compuesto: $e');
      return false;
    }
  }

  Future<bool> reg_al_comp(int id_al, int id_al_comp, double porcion) async {
    final conn = await establecer_conexion();
    try {
      await conn.query(
          '''insert into al_comp (id_al,id_al_comp,porcion) values ($id_al,$id_al_comp,$porcion)''');
      return true;
    } catch (e) {
      print('error en registrar alimento compuesto: $e');
      return false;
    }
  }
}



/*
busqueda de alimentos
  listar_alimentos_comp(nombre, tipo,calorias, restriccion)

Registro alimento compuesto
  reg_al_comp(nombre,alimentos)
*/