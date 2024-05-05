// TODO: create function for create and filter room

import 'package:flutter/material.dart';
import 'package:project/service/room.dart';
import 'package:project/widget/box/box.dart';
import 'package:project/widget/page/lobby.dart';
import 'package:project/widget/appBar.dart';
import 'package:project/widget/buttomNav.dart';

class _LobbyPageState extends State<LobbyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        menuItem: [Icons.add_rounded, 'Play', Icons.filter_list_rounded],
        onTapmenuItem: [create, null, filter],
      ),
      body: Stack(
        children: [
          ListView(
            children: [
              Column(
                children: [
                  pageWidget.room(allRoom, maxRoomPerPage, currentPage),
                  pageWidget.pageNavigation(currentPage, allRoom.length,
                      maxRoomPerPage, 6, 30, changePage),
                ],
              ),
            ],
          ),
          BoxWidget()
              .filter(RoomService().getFilter(), filterBoxVisible, 260, 200),
        ],
      ),
      bottomNavigationBar: BottomNavigation(currentIndex: 1, game: widget.game),
    );
  }

  void create() {}

  void filter() {
    setState(() {
      filterBoxVisible = !filterBoxVisible;
    });
  }

  void changePage(int index) {
    setState(() {
      currentPage = index;
    });
  }

  bool filterBoxVisible = false;
  int currentPage = 0;

  final List<dynamic> allRoom = RoomService().getRoom();
  final int maxRoomPerPage = 30;

  late final LobbyWidget pageWidget = LobbyWidget(context: context);
}

class LobbyPage extends StatefulWidget {
  final String game;

  const LobbyPage({Key? key, required this.game}) : super(key: key);

  @override
  State<LobbyPage> createState() => _LobbyPageState();
}
