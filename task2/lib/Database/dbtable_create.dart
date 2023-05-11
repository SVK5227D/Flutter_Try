import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
// ignore_for_file: non_constant_identifier_names

class DatabaseConnection {
  Future<Database> setDatabase() async {
    print("Path connection has called");
    var directory = await getApplicationDocumentsDirectory();
    var path = join(directory.path, 'task2');
    var database =
        await openDatabase(path, version: 1, onCreate: _createDatabase);
    return database;
  }

  Future<void> _createDatabase(Database database, int version) async {
    await database.execute(
      "CREATE TABLE userInput ("
      "ID INTEGER PRIMARY KEY AUTOINCREMENT,"
      "firstName TEXT,"
      "lastName TEXT,"
      "emailid TEXT,"
      "mobileNumber TEXT"
      ")",
    );
    print('query running');
    String query = "userInput";
    var result = await database.query(query);
    print(result);
  }
}
