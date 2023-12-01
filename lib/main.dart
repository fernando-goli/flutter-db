import 'package:flutter/material.dart';
import 'package:project1/data/taskInherited.dart';
import 'screens/Initial_screen.dart';

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
        home: TaskInherited(child: const InitialScreen()),
        //home: const MyHomePage(title: 'Flutter Demo Home Page'),
        );
  }
}
