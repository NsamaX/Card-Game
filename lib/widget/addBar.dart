import 'package:flutter/material.dart';

class AddBar extends StatefulWidget {
  final List<int> _count;
  final Function(int) _onTap;

  const AddBar(
      {Key? key, required List<int> count, required Function(int) onTap})
      : _count = count,
        _onTap = onTap,
        super(key: key);

  @override
  State<AddBar> createState() => _AddBarState();
}

class _AddBarState extends State<AddBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final ThemeData _theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
      child: Container(
        height: 40.0,
        decoration: BoxDecoration(
          color: _theme.primaryColor,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          children: widget._count
              .map((entry) => _box(_theme, entry, widget._count.indexOf(entry)))
              .toList(),
        ),
      ),
    );
  }

  Widget _box(ThemeData theme, int card, int index) {
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
                ? theme.secondaryHeaderColor
                : theme.primaryColor,
            borderRadius: BorderRadius.circular(8.0),
            border: Border(
              left: BorderSide(
                color: theme.iconTheme.color!.withOpacity(0.2),
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
                  style: theme.textTheme.titleSmall,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
