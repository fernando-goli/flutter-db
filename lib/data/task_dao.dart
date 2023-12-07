import 'package:project1/data/database.dart';
import 'package:sqflite/sqflite.dart';
import '../components/tarefa.dart';

class TaskDao {
  static const String _tablename = 'taskTable';
  static const String _name = 'name';
  static const String _difficulty = 'difficulty';
  static const String _photo = 'image';

  static const String tableSql = 'CREATE TABLE $_tablename('
      '$_name TEXT, '
      '$_difficulty INTEGER, '
      '$_photo TEXT)';

  save(Task task) async {
    final Database db = await getDatabase();
    var itemExists = await find(task.nome);
    Map<String, dynamic> taskMap = toMap(task);
    if (itemExists.isEmpty) {
      return await db.insert(_tablename, toMap(task));
    } else {
      return await db.update(
        _tablename,
        taskMap,
        where: '$_name = ?',
        whereArgs: [task.nome],
      );
    }
  }

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

  delete(String name) async {
    final Database db = await getDatabase();
    return db.delete(
      _tablename,
      where: '$_name = ?',
      whereArgs: [name],
    );
  }

  List<Task> toList(List<Map<String, dynamic>> mapTask) {
    final List<Task> tasks = [];
    for (Map<String, dynamic> line in mapTask) {
      final Task task = Task(line[_name], line[_photo], line[_difficulty]);
      tasks.add(task);
    }
    return tasks;
  }

  Map<String, dynamic> toMap(Task task){
    final Map<String, dynamic> mapTasks = {};
    mapTasks[_name] = task.nome;
    mapTasks[_difficulty] = task.difficulty;
    mapTasks[_photo] = task.photo;
    return mapTasks;
  }
}
