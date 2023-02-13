import 'package:flutter/material.dart';
import 'package:lesson_one/data/task_inherited.dart';
// import 'package:flutter/cupertino.dart';

// import '../components/task.dart';
import 'form.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Learning Progress',
          style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              fontFamily: 'RobotoSlab'),
        ),
      ),
      body: Container(
        color: const Color.fromARGB(40, 236, 249, 255),
        child: ListView(
          padding: const EdgeInsets.only(top: 8, bottom: 80),
          children: TaskInherited.of(context).taskList,
        ),
      ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (newContext) => FormScreen(taskContext: context))
              );
        },
          child: const Icon(Icons.add),
        ),
    );
  }
}
