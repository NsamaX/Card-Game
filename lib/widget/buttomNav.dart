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
      onTap: (index) =>
          navigate(context: context, index: index, game: widget.game),
    );
  }

  BottomNavigationBarItem navigation(String label, IconData iconData) {
    return BottomNavigationBarItem(icon: Icon(iconData), label: label);
  }

  void navigate(
      {required BuildContext context,
      required int index,
      required String game}) {
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
  final String game;
  final int currentIndex;

  const BottomNavigation(
      {Key? key, required this.game, required this.currentIndex})
      : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}
