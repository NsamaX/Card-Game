import 'package:flutter/material.dart';
import 'package:project/theme/color.dart';

class Operator extends StatelessWidget {
  final String operator;
  final Function(String) onTap;

  const Operator({
    Key? key,
    required this.operator,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          onTap(operator);
        },
        child: Container(
          height: 30.0,
          width: 30.0,
          decoration: BoxDecoration(
            color: mainColor4,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Icon(
              operator == '+'
                  ? Icons.arrow_forward_ios_rounded
                  : Icons.arrow_back_ios_rounded,
              color: Colors.white,
              size: 12.0,
            ),
          ),
        ),
      ),
    );
  }
}
