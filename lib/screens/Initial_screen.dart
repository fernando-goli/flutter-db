import 'package:flutter/material.dart';
import '../components/Task.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  bool opacity = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tarefas"),
      ),
      body: AnimatedOpacity(
        duration: const Duration(seconds: 1),
        opacity: opacity ? 1 : 0,
        child: ListView(
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
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        setState(() {
          opacity = !opacity;
        });
      }),
    );
  }
}
