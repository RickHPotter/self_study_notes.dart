import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';

import '../components/task.dart';
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
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            Task(
              title: 'Portuguese - Module I',
              path: 'assets/images/br.jpg',
              difficulty: 3,
            ),
            Task(
              title: 'English - Module I',
              path: 'assets/images/gb.jpg',
              difficulty: 1,
            ),
            Task(
              title: 'Spanish - Module I',
              path: 'assets/images/sp.jpg',
              difficulty: 3,
            ),
            Task(
              title: 'French - Module I',
              path: 'assets/images/fr.jpg',
              difficulty: 2,
            ),
            Task(
              title: 'Portuguese - Module VII',
              path: 'assets/images/br.jpg',
              difficulty: 5,
            ),
            SizedBox(
              height: 80,
            )
          ],
        ),
      ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const FormScreen())
              );
        },
          child: const Icon(Icons.add),
        ),
    );
  }
}
