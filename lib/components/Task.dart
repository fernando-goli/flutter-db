import 'package:flutter/material.dart';
import 'package:project1/components/rate_star.dart';

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

  bool assetOrNetwork() {
    if (widget.photo.contains("asset")) {
      return true;
    }
    return false;
  }

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
            height: 140,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.blue,
            ),
          ),
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.white,
                ),
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.black26,
                      ),
                      width: 72,
                      height: 100,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: assetOrNetwork()
                            ? Image.asset(
                                //child: Image.asset(
                                widget.photo,
                                fit: BoxFit.cover,
                              )
                            : Image.network(
                                widget.photo,
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                            width: 200,
                            child: Text(
                              widget.nome,
                              style: const TextStyle(
                                  fontSize: 18,
                                  overflow: TextOverflow.ellipsis),
                            )),
                        RateStar(difficulty: widget.difficulty)
                      ],
                    ),
                    SizedBox(
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
                          value: widget.difficulty > 0
                              ? (_counter / widget.difficulty) / 10
                              : 1,
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
