// TODO: add animation when mouse on button icon

import 'package:flutter/material.dart';
import 'package:project/page/deck.dart';
import 'package:project/page/lobby.dart';
import 'package:project/page/setting.dart';

class _BottomNavigationState extends State<BottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        navigation('Deck', Icons.web_stories_rounded),
        navigation('Lobby', Icons.style_rounded),
        navigation('Setting', Icons.settings_rounded)
      ],
      currentIndex: widget.currentIndex,
      onTap: (index) => navigate(context, index, widget.game),
    );
  }

  BottomNavigationBarItem navigation(String label, IconData iconData) {
    return BottomNavigationBarItem(icon: Icon(iconData), label: label);
  }

  void navigate(BuildContext context, int index, String game) {
    Widget page;

    switch (index) {
      case 0:
        page = DeckPage(game: game);
        break;
      case 1:
        page = LobbyPage(game: game);
        break;
      case 2:
        page = SettingPage(game: game);
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

class BottomNavigation extends StatefulWidget {
  final int currentIndex;
  final String game;

  const BottomNavigation(
      {Key? key, required this.currentIndex, required this.game})
      : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}
