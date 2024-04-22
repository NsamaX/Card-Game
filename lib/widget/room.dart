import 'package:flutter/material.dart';
import 'label.dart';
import 'page.dart';

class rooM extends StatefulWidget {
  final List<dynamic> _room;
  final int _page;
  final int _icon;

  const rooM({
    Key? key,
    required List<dynamic> room,
    required int page,
    required int icon,
  })  : _room = room,
        _page = page,
        _icon = icon,
        super(key: key);

  @override
  _roomState createState() => _roomState();
}

class _roomState extends State<rooM> {
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    int _start = _currentPage * widget._page;
    int _end = (_currentPage + 1) * widget._page;
    if (_end > widget._room.length) _end = widget._room.length;

    return Expanded(
      child: Column(
        children: [
          labeL(label: widget._room.sublist(_start, _end)),
          pagE(
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
