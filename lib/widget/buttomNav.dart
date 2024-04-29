import 'package:flutter/material.dart';
import 'package:project/page/deck/page.dart';
import 'package:project/page/play.dart';
import 'package:project/page/setting.dart';

class bottomNav extends StatelessWidget {
  final int _currentIndex;

  const bottomNav({Key? key, required int currentIndex})
      : _currentIndex = currentIndex,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        _navigation('Deck', Icons.web_stories_rounded),
        _navigation('Play', Icons.style_rounded),
        _navigation('Setting', Icons.settings_rounded),
      ],
      currentIndex: _currentIndex,
      onTap: (index) {
        _navigate(context, index);
      },
    );
  }

  BottomNavigationBarItem _navigation(String label, IconData iconData) {
    return BottomNavigationBarItem(
      icon: Icon(iconData),
      label: label,
    );
  }

  void _navigate(BuildContext context, int index) {
    Widget _page;

    switch (index) {
      case 0:
        _page = decKpagE();
        break;
      case 1:
        _page = plaYpagE();
        break;
      case 2:
        _page = setting();
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
