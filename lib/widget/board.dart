import 'package:flutter/material.dart';
import 'package:project/theme/color.dart';

class Board {
  static Widget buildRow(List<String> rowText) {
    return Row(
      children: [
        for (int i = 0; i < rowText.length; i++) buildField(rowText[i]),
      ],
    );
  }

  static Widget buildField(String text) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 80.0,
          decoration: BoxDecoration(
            color: mainColor3,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                  color: Colors.white.withOpacity(0.4), fontSize: 12.0),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
