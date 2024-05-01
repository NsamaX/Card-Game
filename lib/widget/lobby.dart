import 'package:flutter/material.dart';
import 'label.dart';
import 'pageNav.dart';

class Lobby extends StatefulWidget {
  final List<dynamic> _room;
  final int _maxRoomPerPage;
  final int _maxNavigationTap;

  const Lobby({
    Key? key,
    required List<dynamic> room,
    required int maxRoomPerPage,
    required int maxNavigationTap,
  })  : _room = room,
        _maxRoomPerPage = maxRoomPerPage,
        _maxNavigationTap = maxNavigationTap,
        super(key: key);

  @override
  _LobbyState createState() => _LobbyState();
}

class _LobbyState extends State<Lobby> {
  int _currentPage = 0;

  int get _startIndex => _currentPage * widget._maxRoomPerPage;
  int get _endIndex => (_currentPage + 1) * widget._maxRoomPerPage;
  int get _totalRoom => widget._room.length;

  List<dynamic> get currentRoom => widget._room.sublist(
        _startIndex,
        _endIndex.clamp(0, _totalRoom),
      );

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Label(label: currentRoom),
          PageNavigation(
            currentPage: _currentPage,
            maxRoomPerPage: (_totalRoom / widget._maxRoomPerPage).ceil(),
            maxNavigationTap: widget._maxNavigationTap,
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
