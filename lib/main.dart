import 'package:flutter/material.dart';
import 'package:lesson_one/data/task_inherited.dart';
// import 'package:flutter/cupertino.dart';

import 'screens/init.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: TaskInherited(child: const HomeScreen())
    );
  }
}

