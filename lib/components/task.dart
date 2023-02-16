import 'package:flutter/material.dart';
import 'package:lesson_one/data/task_dao.dart';
// import 'package:flutter/cupertino.dart';

import 'difficulty.dart';

class Task extends StatefulWidget {
  Task({Key? key,
    required this.title,
    required this.path,
    required this.difficulty})
      : super(key: key);

  String title;
  String path;
  int difficulty;

  int level = 0;

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {

  bool assetOrNetwork() => widget.path.contains('http');

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            height: 140,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9),
              color: Colors.blue,
            ),
          ),
          Column(
            children: [
              Container(
                height: 100,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12, width: .6),
                  borderRadius: const BorderRadius.all(Radius.circular(9)),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 3, right: 3),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 80, width: 100,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(9),
                          child: assetOrNetwork()
                              ? Image.network(widget.path, fit: BoxFit.cover,)
                              : Image.asset(widget.path, fit: BoxFit.cover,)
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
                                fontFamily: 'SF',
                                fontWeight: FontWeight.w300,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          Difficulty(difficulty: widget.difficulty),
                        ],
                      ),
                      SizedBox(
                        height: 52, width: 52,
                        child: ElevatedButton(
                          onLongPress: () async {
                              await TaskDao().delete(widget.title);
                            setState(() {
                              debugPrint('[TASK] - deleting task');
                            });
                          },
                            onPressed: () {
                              setState(() {
                                widget.level++;
                                if (widget.level == widget.difficulty * 10) {
                                  TaskDao().delete(widget.title);
                                }
                              });
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: const [
                                Icon(Icons.arrow_drop_up),
                                Text(
                                  'UP',
                                  style: TextStyle(
                                    fontFamily: 'Raleway',
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
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
                              ? widget.level / widget.difficulty / 10
                              : 1

                      ),
                    ),
                    Text(
                        'Level: ${widget.level}',
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
