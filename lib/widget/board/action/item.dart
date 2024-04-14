import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  final IconData icon;
  final Function() onPressed;

  const Item({
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 16.0,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: Colors.black,
          size: 16.0,
        ),
      ),
    );
  }
}
