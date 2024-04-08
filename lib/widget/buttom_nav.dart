import 'package:flutter/material.dart';
import 'package:project/page/deck/page.dart';
import 'package:project/page/play/page.dart';
import 'package:project/page/setting/page.dart';

class BottomNav extends StatelessWidget {
  final int currentIndex;

  const BottomNav({Key? key, required this.currentIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        buildBottomNav('Deck', Icons.web_stories_rounded),
        buildBottomNav('Play', Icons.style_rounded),
        buildBottomNav('Setting', Icons.settings),
      ],
      currentIndex: currentIndex,
      onTap: (index) {
        navigateToPage(context, index);
      },
    );
  }

  BottomNavigationBarItem buildBottomNav(String label, IconData iconData) {
    return BottomNavigationBarItem(
      icon: Icon(iconData),
      label: label,
    );
  }

  void navigateToPage(BuildContext context, int index) {
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
