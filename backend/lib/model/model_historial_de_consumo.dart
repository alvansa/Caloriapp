import 'package:postgres/postgres.dart';

class model_historial_de_consumo {
  Future<PostgreSQLConnection> establecer_conexion() async {
    final connection = PostgreSQLConnection('localhost', 5432, 'caloriapp',
        username: 'postgres', password: 'postgres');
    await connection.open();
    return connection;
  }

  Future<List<List<dynamic>>> lista_historial(String email) async {
    final connection = await establecer_conexion();
    final List<List<dynamic>> results = await connection.query(
        'select * from historial where email = @email;',
        substitutionValues: {'email': email});
    await connection.close();
    return results;
  }

  Future<bool> registrar_consumo(
      String fecha, int id_al, int porcion, String email) async {
    try {
      final conn = await establecer_conexion();
      await conn.query(
          'insert into historial (email,id_al,fecha) values (@email,$id_al,@fecha)',
          substitutionValues: {'email': email, 'fecha': fecha});
      await conn.close();
      return true;
    } catch (e) {
      print('ocurrio un error al conectar a la base de datos error $e');
      return false;
    }
  }
}



/* historial de consumo
-registrar_cosumo(fecha,porcion,alimento) añadir usuario

  insert into historial (email,id_al,fecha) values ('a@b.com',1,'2023-07-18');
    - la fecha se agrega como string '2023-07-18' con año-mes-dia.

-lista_historial(fecha) añadir usuario

  select * from historial where email = 'a@b.com';
  
*/ 
