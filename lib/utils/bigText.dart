import 'package:flutter/material.dart';

class bigText extends StatelessWidget {
  final String text;
  double size;

  Color color;
  bigText({
    super.key,
    required this.text,
    this.size = 18,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: TextOverflow.clip,
      style: TextStyle(
        fontSize: size,
        color: color,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
