import 'dbtable_create.dart';
import 'package:sqflite/sqflite.dart';

class OperationValue {
  late DatabaseConnection _databaseConnection;
  OperationValue() {
    _databaseConnection = DatabaseConnection();
  }
  static Database? _database;
  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    } else {
      _database = await _databaseConnection.setDatabase();
      return _database;
    }
  }

  //Insert User
  insertData(table, data) async {
    print(data);
    var connection = await database;
    // return await connection?.execute(
    //     "INSERT INTO $table ('id','firstName', 'lastName', 'emailid', 'mobileNumber')values (1, ?, ?, ?, ?)"
    //     );
    return await connection?.insert(table, data);
  }

  //Read All Record
  readData(table) async {
    print('Getting a data form table');
    var connection = await database;
    return await connection?.query(table);
  }

  //Update User
  updateData(table, data) async {
    print(data);
    var connection = await database;
    return await connection
        ?.update(table, data, where: 'id=?', whereArgs: [data['id']]);
  }

  //Delete User
  deleteDataById(table, itemId) async {
    var connection = await database;
    return await connection?.rawDelete("delete from $table where id=$itemId");
  }
}
