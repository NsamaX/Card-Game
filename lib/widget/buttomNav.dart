import 'package:flutter/material.dart';
import 'package:project/page/deck/page.dart';
import 'package:project/page/play/page.dart';
import 'package:project/page/setting/page.dart';

class BottomNav extends StatelessWidget {
  final int _currentIndex;

  const BottomNav({Key? key, required int currentIndex})
      : _currentIndex = currentIndex,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        _bottomNav('Deck', Icons.web_stories_rounded),
        _bottomNav('Play', Icons.style_rounded),
        _bottomNav('Setting', Icons.settings_rounded),
      ],
      currentIndex: _currentIndex,
      onTap: (index) {
        _navigatePage(context, index);
      },
    );
  }

  BottomNavigationBarItem _bottomNav(String label, IconData iconData) {
    return BottomNavigationBarItem(
      icon: Icon(iconData),
      label: label,
    );
  }

  void _navigatePage(BuildContext context, int index) {
    Widget page;

    switch (index) {
      case 0:
        page = DeckPage();
        break;
      case 1:
        page = PlayPage();
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
}
