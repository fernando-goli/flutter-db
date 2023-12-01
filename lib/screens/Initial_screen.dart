import 'package:flutter/material.dart';
import 'package:project1/data/taskInherited.dart';
import 'package:project1/screens/formulary.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tarefas"),
      ),
      body: ListView(
        padding: const EdgeInsets.only(top: 8, bottom: 8),
        children: TaskInherited.of(context).taskList,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (contextNew) => FormularyScreen(taskContext: context),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
