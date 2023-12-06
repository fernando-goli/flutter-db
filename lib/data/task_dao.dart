import 'package:project1/data/database.dart';
import 'package:sqflite/sqflite.dart';
import '../components/Task.dart';

class TaskDao {
  static const String _tablename = 'taskTable';
  static const String _name = 'name';
  static const String _difficulty = 'difficulty';
  static const String _photo = 'image';

  static const String tableSql = 'CREATE TABLE $_tablename('
      '$_name TEXT, '
      '$_difficulty INTEGER, '
      '$_photo TEXT)';

  save(Task tarefa) async {}

  Future<List<Task>> findAll() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(_tablename);
    return toList(result);
  }

  Future<List<Task>> find(String name) async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(
      _tablename,
      where: '$_name = ?',
      whereArgs: [name],
    );
    return toList(result);
  }

  delete(String name) async {}

  List<Task> toList(List<Map<String, dynamic>> mapTask) {
    final List<Task> tasks = [];
    for (Map<String, dynamic> line in mapTask) {
      final Task task = Task(line[_name], line[_photo], line[_difficulty]);
      tasks.add(task);
    }
    return tasks;
  }
}
