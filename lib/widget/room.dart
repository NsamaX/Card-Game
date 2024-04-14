import 'package:flutter/material.dart';
import 'label.dart';
import 'pageNav.dart';

class Room extends StatefulWidget {
  final List<dynamic> _room;
  final int _page;
  final int _icon;

  Room({
    Key? key,
    required List<dynamic> room,
    required int page,
    required int icon,
  })  : _room = room,
        _page = page,
        _icon = icon,
        super(key: key);

  @override
  _Roomtate createState() => _Roomtate();
}

class _Roomtate extends State<Room> {
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    int start = _currentPage * widget._page;
    int end = (_currentPage + 1) * widget._page;
    if (end > widget._room.length) end = widget._room.length;

    return Expanded(
      child: Column(
        children: [
          Label(label: widget._room.sublist(start, end)),
          PageBar(
            currentPage: _currentPage,
            page: (widget._room.length / widget._page).ceil(),
            icon: widget._icon,
            onTap: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
          ),
        ],
      ),
    );
  }
}
