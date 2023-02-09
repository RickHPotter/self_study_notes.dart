import 'package:flutter/material.dart';

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
          primarySwatch: Colors.cyan,
        ),
        home: Scaffold(
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
          body: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Task(title: 'English - Module III'),
              Task(title: 'Spain - Module IV'),
              Task(title: 'French - Module I'),
              Task(title: 'Portuguese - Module VI'),
            ],
          ),
          floatingActionButton: FloatingActionButton(onPressed: () {})
        ),
    );
  }
}

class Task extends StatelessWidget {
  const Task({Key? key, required this.title})
  : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.blue, height: 140,
        ),
        Container(
          color: Colors.white, height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                height: 80, width: 100,
                child: Image(
                  image: AssetImage('assets/images/fr.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.bold,
                ),
              ),
              ElevatedButton(
                  onPressed: () {},
                  child: const Icon(Icons.arrow_drop_up)),
            ],
          ),
        )
      ],
    );
  }
}
