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
          body: Container(
            color: const Color.fromARGB(50, 100, 100, 100),
            height: 700,
            child: Stack(
              children: [
                Container(
                  color: Colors.blue, height: 140,

                ),
                Container(
                  color: Colors.white, height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        color: Colors.black26, width: 72, height: 100,
                      ),
                      const Text(
                        'English - Module I',
                        style: TextStyle(
                          fontSize: 26,
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
            ),
          ),
          floatingActionButton: FloatingActionButton(onPressed: () {})
        ),
    );
  }
}