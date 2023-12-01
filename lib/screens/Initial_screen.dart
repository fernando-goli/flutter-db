import 'package:flutter/material.dart';
import 'package:project1/screens/formulary.dart';
import '../components/Task.dart';

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
        children: const [
          Task(
              'Teste 1',
              //assets/images/....png
              'https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large',
              3),
          Task(
              'Teste 2',
              'https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large',
              4),
          Task(
              'Teste 3',
              'https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large',
              1),
          Task('Teste 4', '', 2),
          Task(
              'Teste 5',
              'https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large',
              5),
          Task(
              'Teste 6',
              'https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large',
              2),
          Task(
              'Teste 7',
              'https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large',
              3),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FormularyScreen(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
