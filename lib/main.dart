import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Tarefas"),
          ),
          body: ListView(
            children: [
              Task('Teste 1', 'https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large', 3),
              Task('Teste 2', 'https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large', 4),
              Task('Teste 3', 'https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large', 1),
              Task('Teste 4', '', 2),
              Task('Teste 5', 'https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large', 5),
              Task('Teste 6', 'https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large', 2),
              Task('Teste 7', 'https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large', 3),
            ],
          ),
          floatingActionButton: FloatingActionButton(onPressed: () {}),
        )
        //home: const MyHomePage(title: 'Flutter Demo Home Page'),
        );
  }
}

class Task extends StatefulWidget {
  final String nome;
  final String photo;
  final int difficulty;

  const Task(this.nome, this.photo, this.difficulty, {super.key});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            color: Colors.blue,
            height: 140,
          ),
          Column(
            children: [
              Container(
                color: Colors.white,
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      color: Colors.black26,
                      width: 72,
                      height: 100,
                      child: Image.network(
                        widget.photo,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            width: 200,
                            child: Text(
                              widget.nome,
                              style: const TextStyle(
                                  fontSize: 18, overflow: TextOverflow.ellipsis),
                            )),
                        Row(
                          children: [
                            Icon(Icons.star, size: 15, color: widget.difficulty >= 1 ? Colors.blue : Colors.blue[100],),
                            Icon(Icons.star, size: 15, color: widget.difficulty >= 2 ? Colors.blue : Colors.blue[100],),
                            Icon(Icons.star, size: 15, color: widget.difficulty >= 3 ? Colors.blue : Colors.blue[100],),
                            Icon(Icons.star, size: 15, color: widget.difficulty >= 4 ? Colors.blue : Colors.blue[100],),
                            Icon(Icons.star, size: 15, color: widget.difficulty >= 5 ? Colors.blue : Colors.blue[100],),
                          ],
                        )
                      ],
                    ),
                    Container(
                      height: 60,
                      child: ElevatedButton(
                        onPressed: () {
                          _incrementCounter();
                        },
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [Icon(Icons.arrow_drop_up), Text("Up")],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                        width: 200,
                        child: LinearProgressIndicator(
                          value: widget.difficulty > 0 ? (_counter / widget.difficulty) / 10 : 1,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "nivel: $_counter",
                      style: const TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
