import 'package:flutter/cupertino.dart';
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
          primarySwatch: Colors.blue,
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
            color: Color.fromARGB(40, 100, 100, 100),
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
                  title: 'Spain - Module I',
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
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(onPressed: () {})
        ),
    );
  }
}

class Task extends StatefulWidget {
  const Task({Key? key,
    required this.title,
    required this.path,
    required this.difficulty})
  : super(key: key);

  final String title;
  final String path;
  final int difficulty;

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int level = 1;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            height: 140,
            decoration: BoxDecoration(
              // border: ,
              borderRadius: BorderRadius.circular(10),
              color: Colors.blue,
            ),
          ),
          Column(
            children: [
              Container(
                height: 100,
                decoration: BoxDecoration(
                  // border: ,
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 3, right: 3),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 80, width: 100,
                        child: Image(
                          image: AssetImage(widget.path),
                          fit: BoxFit.cover,
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center ,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                          Row(
                            children: [
                              for (var i = 0; i < 5; i++)
                               i <= widget.difficulty
                                   ? const Icon(CupertinoIcons.star_fill, size: 13, color: Colors.blue,)
                                   : const Icon(CupertinoIcons.star, size: 13, color: Colors.blue,)
                            ],
                          ),
                        ],
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
                        value: widget.difficulty > 0
                            ? level / widget.difficulty / 10
                            : 1

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
