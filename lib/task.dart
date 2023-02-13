import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

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
                          child: Image(
                            image: AssetImage(widget.path),
                            fit: BoxFit.cover,
                          ),
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
