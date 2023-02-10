import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Difficulty extends StatelessWidget {

  final int level;

  const Difficulty({
    super.key,
    required this.level,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (var i = 0; i < 5; i++)
          i <= level
              ? const Icon(CupertinoIcons.star_fill, size: 13, color: Colors.blue,)
              : const Icon(CupertinoIcons.star, size: 13, color: Colors.blue,)
      ],
    );
  }
}
