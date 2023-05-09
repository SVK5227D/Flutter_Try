import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
// ignore_for_file: non_constant_identifier_names

class DatabaseConnection {
  Future<Database> setDatabase() async {
    var directory = await getApplicationDocumentsDirectory();
    var path = join(directory.path, 'task2');
    var database =
        await openDatabase(path, version: 1, onCreate: _createDatabase);
    return database;
  }

  Future<void> _createDatabase(Database database, int version) async {
    await database.execute(
      "CREATE TABLE userInput ("
      "id INTEGER AUTO_INCREMENT PRIMARY KEY,"
      "firstName TEXT,"
      "lastName TEXT,"
      "emailid TEXT,"
      "mobileNumber TEXT"
      ")",
    );
  }
}
