import 'package:flutter/material.dart';
import 'theme.dart';

class infoBar extends StatefulWidget {
  final List<int> _count;
  final Function(int) _onTap;

  const infoBar({
    Key? key,
    required List<int> count,
    required Function(int) onTap,
  })  : _count = count,
        _onTap = onTap,
        super(key: key);

  @override
  State<infoBar> createState() => _infoBarState();
}

class _infoBarState extends State<infoBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
      child: Container(
        height: 40.0,
        decoration: BoxDecoration(
          color: themeData().primaryColor,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          children: widget._count
              .map((entry) => _box(entry, widget._count.indexOf(entry)))
              .toList(),
        ),
      ),
    );
  }

  Widget _box(int card, int index) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedIndex = index;
          });
          widget._onTap(index);
        },
        child: Container(
          decoration: BoxDecoration(
            color: index == _selectedIndex
                ? themeData().secondaryHeaderColor
                : themeData().primaryColor,
            borderRadius: BorderRadius.circular(8.0),
            border: Border(
              left: BorderSide(
                color: themeData().iconTheme.color!.withOpacity(0.2),
                width: 2.0,
              ),
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  card.toString(),
                  style: themeData().textTheme.titleSmall,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
