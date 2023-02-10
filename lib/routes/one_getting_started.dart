import 'package:flutter/material.dart';

class FirstWidget extends StatelessWidget {
  const FirstWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column (
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Container(color: Colors.red, height: 100, width: 100),
              Container(color: Colors.blue, height: 50, width: 50),
            ],
          ),
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Container(color: Colors.blue, height: 100, width: 100),
              Container(color: Colors.red, height: 50, width: 50),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                color: Colors.cyan, height: 50, width: 50,
              ),
              Container(
                color: Colors.pinkAccent, height: 50, width: 50,
              ),
              Container(
                color: Colors.purple, height: 50, width: 50,
              ),
            ],
          ),
          Container(
            color: Colors.amber,
            height: 30,
            width: 300,
            child: const Text(
              'Hi, bitch!',
              style: TextStyle(
                color: Colors.green,
                fontSize: 26,
                decoration: TextDecoration.none,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          ElevatedButton(
              onPressed: (){},
              child: const Text('Press the Button.')
          ),
        ], // Children
      ),
    );
  }
}
