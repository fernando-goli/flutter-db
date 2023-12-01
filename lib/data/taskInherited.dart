import 'package:flutter/material.dart';
import '../components/Task.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({
    super.key,
    required Widget child,
  }) : super(child: child);

  static TaskInherited of(BuildContext context) {
    final TaskInherited? result =
        context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, 'No Taskinherited found in context');
    return result!;
  }

  final List<Task> taskList = [
    Task(
        'Teste 1',
        //assets/images/....png
        'https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large',
        3),
    Task('Teste 2',
        'https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large', 4),
    Task('Teste 3',
        'https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large', 1),
    Task('Teste 4', '', 2),
    Task('Teste 5',
        'https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large', 5),
    Task('Teste 6',
        'https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large', 2),
  ];

  void newTask(String name, String photo, int diff) {
    taskList.add(Task(name, photo, diff));
  }

  @override
  bool updateShouldNotify(TaskInherited old) {
    return old.taskList.length != taskList.length;
  }
}
