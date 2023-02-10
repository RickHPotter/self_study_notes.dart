import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';

import 'routes/init.dart';
// import 'routes/form.dart';

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
        home: const HomeScreen()
        // home: const FormScreen()
    );
  }
}

