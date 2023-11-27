import 'package:flutter/material.dart';

class FormularyScreen extends StatefulWidget {
  const FormularyScreen({super.key});

  @override
  State<FormularyScreen> createState() => _FormularyScreenState();
}

class _FormularyScreenState extends State<FormularyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nova tarefa'),
      ),
      body: Center(
        child: Container(
          height: 650,
          width: 375,
          decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(width: 3)
          ),
          child: Column(
            children: [

            ],
          ),
        ),
      ),
    );
  }
}
