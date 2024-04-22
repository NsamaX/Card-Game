import 'package:flutter/material.dart';
import 'package:project/page/deck/page.dart';
import 'package:project/page/play/page.dart';
import 'package:project/page/setting/page.dart';

class bottoMnaV extends StatelessWidget {
  final int _currentIndex;

  const bottoMnaV({Key? key, required int currentIndex})
      : _currentIndex = currentIndex,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        _Navigation('Deck', Icons.web_stories_rounded),
        _Navigation('Play', Icons.style_rounded),
        _Navigation('Setting', Icons.settings_rounded),
      ],
      currentIndex: _currentIndex,
      onTap: (index) {
        _navigate(context, index);
      },
    );
  }

  BottomNavigationBarItem _Navigation(String label, IconData iconData) {
    return BottomNavigationBarItem(
      icon: Icon(iconData),
      label: label,
    );
  }

  void _navigate(BuildContext context, int index) {
    Widget _page;

    switch (index) {
      case 0:
        _page = DeckPage();
        break;
      case 1:
        _page = PlayPage();
        break;
      case 2:
        _page = SettingPage();
        break;
      default:
        _page = Container();
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => _page),
    );
  }
}
