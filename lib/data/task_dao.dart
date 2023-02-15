import 'package:lesson_one/data/database.dart';
import 'package:sqflite/sqflite.dart';

import '../components/task.dart';

class TaskDao {
  static const String _tableName = 'taskTable';
  static const String _name = 'name';
  static const String _difficulty = 'difficulty';
  static const String _url = 'url';

  static const String tableSQL = 'CREATE TABLE $_tableName('
      '$_name TEXT, $_difficulty INTEGER, $_url TEXT)';

  List<Task> toList(List<Map<String, dynamic>> tasksMap) {
    print('Parsing Map into List...');
    final List<Task> tasks = [];
    for (Map<String, dynamic> line in tasksMap) {
      final Task task = Task(
        title: line[_name],
        path: line[_url],
        difficulty: line[_difficulty],
      );
      tasks.add(task);
    }
    print('Tasks List $tasks.');
    return tasks;
  }

  Map<String, dynamic> toMap(Task task) {
    print('Parsing List into Map...');
    final Map<String, dynamic> tasks = {};
    tasks.addAll(
        {_name: task.title, _url: task.path, _difficulty: task.difficulty});
    print('TasksMap has been created $tasks.');
    return tasks;
  }

  // CREATE
  create(Task task) async {
    print('Initiating database...');
    final Database db = await getDataBase();
    var itemExists = await findSome(task.title);
    Map<String, dynamic> tasksMap = toMap(task);

    if (itemExists.isEmpty) {
      print('Task does not exist.');
      return await db.insert(_tableName, tasksMap);
    } else {
      print('Task already exists.');
      return await db.update(_tableName, tasksMap,
          where: '$_name = ?', whereArgs: [task.title]);
    }
  }

  // READ
  Future<List<Task>> findAll() async {
    print('Accessing findAll()');
    final Database db = await getDataBase();
    final List<Map<String, dynamic>> tasks = await db.query(_tableName);
    print('Looking up data... \nFound $tasks');
    return toList(tasks);
  }

  Future<List<Task>> findSome(String taskName) async {
    print('Accessing findSome()');
    final Database db = await getDataBase();
    final List<Map<String, dynamic>> tasks = await db.query(
      _tableName,
      where: '$_name = ?',
      whereArgs: [taskName],
    );
    print('Looking up data... \nFound $tasks');
    return toList(tasks);
  }

  // UPDATE

  // DELETE
  delete(String taskName) async {
    print('Deleting task...');
    final Database db = await getDataBase();
    return db.delete(
      _tableName,
      where: '$_name = ?',
      whereArgs: [taskName],
    );
  }
}
