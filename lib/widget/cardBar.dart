import 'package:flutter/material.dart';
import 'theme.dart';

class carDbaR extends StatefulWidget {
  final List<dynamic> _data;
  final Function(int) _onTap;

  const carDbaR({
    Key? key,
    required List<dynamic> data,
    required Function(int) onTap,
  })  : _data = data,
        _onTap = onTap,
        super(key: key);

  @override
  State<carDbaR> createState() => _carDbaRState();
}

class _carDbaRState extends State<carDbaR> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
      child: Container(
        height: 40.0,
        decoration: BoxDecoration(
          color: themE().primaryColor,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          children: List.generate(
            widget._data.length,
            (index) {
              return _bar(
                widget._data[index]['text'],
                widget._data[index]['value'],
                index,
              );
            },
          ).toList(),
        ),
      ),
    );
  }

  Widget _bar(String text, int card, int index) {
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
                ? text != ''
                    ? themE().secondaryHeaderColor
                    : themE().iconTheme.color
                : themE().primaryColor,
            borderRadius: BorderRadius.circular(8.0),
            border: Border(
              left: BorderSide(
                color: themE().iconTheme.color!.withOpacity(0.2),
                width: 2.0,
              ),
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (text != '') ...[
                  Text(text, style: themE().textTheme.bodyMedium),
                ] else ...[
                  Text(
                    card.toString(),
                    style: themE().textTheme.titleSmall?.copyWith(
                          color: index == _selectedIndex
                              ? themE().primaryColor
                              : themE().iconTheme.color,
                        ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
