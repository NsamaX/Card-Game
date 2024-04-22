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
        _buildBottomNav('Deck', Icons.web_stories_rounded),
        _buildBottomNav('Play', Icons.style_rounded),
        _buildBottomNav('Setting', Icons.settings_rounded),
      ],
      currentIndex: _currentIndex,
      onTap: (index) {
        _navigateToPage(context, index);
      },
    );
  }

  BottomNavigationBarItem _buildBottomNav(String label, IconData iconData) {
    return BottomNavigationBarItem(
      icon: Icon(iconData),
      label: label,
    );
  }

  void _navigateToPage(BuildContext context, int index) {
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
