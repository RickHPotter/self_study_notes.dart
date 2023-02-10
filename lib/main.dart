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
          body: ListView(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Task(title: 'English - Module III'),
              Task(title: 'Spain - Module IV'),
              Task(title: 'French - Module I'),
              Task(title: 'Portuguese - Module VI'),
              Task(title: 'Portuguese - Module VI'),
              Task(title: 'Portuguese - Module VI'),
            ],
          ),
          floatingActionButton: FloatingActionButton(onPressed: () {})
        ),
    );
  }
}

class Task extends StatefulWidget {
  const Task({Key? key, required this.title})
  : super(key: key);

  final String title;

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int level = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            color: Colors.blue, height: 140,
          ),
          Column(
            children: [
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
                    SizedBox(
                      width: 200,
                      child: Text(
                        widget.title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 52, width: 52,
                      child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              level++;
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: const [
                              Icon(Icons.arrow_drop_up),
                              Text('UP', style: TextStyle(fontSize: 12),),
                            ],
                          )),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 200,
                      child: LinearProgressIndicator(
                        color: Colors.white,
                        value: level  / 10,
                      ),
                    ),
                  Text(
                    'Level: $level',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: 'RobotoSlab',
                      overflow: TextOverflow.ellipsis,
                    )),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
