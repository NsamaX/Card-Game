import 'package:flutter/material.dart';
import 'package:project/theme_color.dart';

class CardBar extends StatefulWidget {
  final List<Map<String, dynamic>> data;
  final void Function(int) onSelectValue;

  const CardBar({
    Key? key,
    required this.data,
    required this.onSelectValue,
  }) : super(key: key);

  @override
  State<CardBar> createState() => _CardBarState();
}

class _CardBarState extends State<CardBar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
      child: Container(
        height: 40.0,
        decoration: BoxDecoration(
          color: mainColor4,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          children: List.generate(
            widget.data.length,
            (index) {
              return buildCardBar(
                widget.data[index]['data'],
                widget.data[index]['value'],
                index,
              );
            },
          ).toList(),
        ),
      ),
    );
  }

  Widget buildCardBar(String text, int card, int index) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedIndex = index;
          });
          widget.onSelectValue(index);
        },
        child: Container(
          decoration: BoxDecoration(
            color: index == selectedIndex ? Colors.white : mainColor4,
            borderRadius: BorderRadius.circular(8.0),
            border: Border(
              left: BorderSide(
                color: Colors.white.withOpacity(0.2),
                width: 2.0,
              ),
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (text != '') Text(text),
                Text(
                  card.toString(),
                  style: TextStyle(
                    color: index == selectedIndex ? Colors.black : Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
