import 'package:todoapp/utils/floor/dao/dao.dart';
import 'package:todoapp/utils/floor/dao/data_base.dart';

class DatabaseManager {
  static final DatabaseManager _instance = DatabaseManager._internal();

  factory DatabaseManager() {
    return _instance;
  }

  DatabaseManager._internal();

  late final AppDatabase database;
  late final TodoDao dao;

  Future<void> initDatabase() async {
    database =
        await $FloorAppDatabase.databaseBuilder('todo_database.db').build();
    dao = database.todoDao;
  }
}

// Usage:
// Wherever you need to access the database and dao:
// DatabaseManager().dao.someMethod();
