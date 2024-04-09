import 'package:flutter/material.dart';

class Option extends StatelessWidget {
  final int count;

  const Option({
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 26.0,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: Text(
        count.toString(),
        style: TextStyle(
          color: Colors.black,
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
