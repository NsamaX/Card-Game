// TODO: create function for create and filter room

import 'package:flutter/material.dart';
import 'package:project/service/room.dart';
import 'package:project/widget/appBar.dart';
import 'package:project/widget/buttomNav.dart';
import 'package:project/widget/box/box.dart';
import 'package:project/widget/lobby.dart';

class LobbyPage extends StatefulWidget {
  const LobbyPage({Key? key}) : super(key: key);

  @override
  State<LobbyPage> createState() => _LobbyPageState();
}

class _LobbyPageState extends State<LobbyPage> {
  bool filterBoxVisible = false;
  int currentPage = 0;

  void filter() {
    setState(() {
      filterBoxVisible = !filterBoxVisible;
    });
  }

  void create() {}

  void changePage(int index) {
    setState(() {
      currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final LobbyWidget pageWidget = LobbyWidget(context: context);
    final List<dynamic> room = RoomService().getRoom();
    final int maxRoomPerPage = 30;

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
                  pageWidget.room(room, maxRoomPerPage, currentPage),
                  pageWidget.pageNavigation(currentPage, room.length,
                      maxRoomPerPage, 6, 30, changePage),
                ],
              ),
            ],
          ),
          Box().filter(RoomService().getFilter(), filterBoxVisible, 260, 200),
        ],
      ),
      bottomNavigationBar: BottomNavigation(currentIndex: 1),
    );
  }
}
