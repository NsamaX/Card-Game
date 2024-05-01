import 'package:flutter/material.dart';
import 'package:project/page/deck.dart';
import 'package:project/page/lobby.dart';
import 'package:project/page/setting.dart';

class BottomNavigation extends StatelessWidget {
  final int _currentIndex;

  const BottomNavigation({Key? key, required int currentIndex})
      : _currentIndex = currentIndex,
        super(key: key);

  void _navigate(BuildContext context, int index) {
    Widget page;

    switch (index) {
      case 0:
        page = DeckPage();
        break;
      case 1:
        page = LobbyPage();
        break;
      case 2:
        page = SettingPage();
        break;
      default:
        page = Container();
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        _navigation('Deck', Icons.web_stories_rounded),
        _navigation('Play', Icons.style_rounded),
        _navigation('Setting', Icons.settings_rounded),
      ],
      currentIndex: _currentIndex,
      onTap: (index) => _navigate(context, index),
    );
  }

  BottomNavigationBarItem _navigation(String label, IconData iconData) {
    return BottomNavigationBarItem(
      icon: Icon(iconData),
      label: label,
    );
  }
}
