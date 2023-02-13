import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Difficulty extends StatelessWidget {

  final int difficulty;

  const Difficulty({
    super.key,
    required this.difficulty,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (var i = 1; i < 6; i++)
          i <= difficulty
              ? const Icon(CupertinoIcons.star_fill, size: 13, color: Colors.blue,)
              : const Icon(CupertinoIcons.star, size: 13, color: Colors.blue,)
      ],
    );
  }
}
