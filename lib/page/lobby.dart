// TODO: create function for create and filter room

import 'package:flutter/material.dart';
import 'package:project/api/service/room.dart';
import 'package:project/widget/box/box.dart';
import 'package:project/widget/page/lobby.dart';
import 'package:project/widget/appBar.dart';
import 'package:project/widget/buttomNav.dart';

class _LobbyPageState extends State<LobbyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(menu: {
        Icons.add_rounded: create,
        'Play': null,
        Icons.filter_list_rounded: filter
      }),
      body: Stack(
        children: [
          ListView(
            children: [
              Column(
                children: [
                  pageWidget.room(
                      allRoom: allRoom,
                      maxRoomPerPage: maxRoomPerPage,
                      currentPage: currentPage),
                  pageWidget.pageNavigation(
                      currentPage: currentPage,
                      totalRoom: allRoom.length,
                      maxRoomPerPage: maxRoomPerPage,
                      maxNavigationTap: 6,
                      navigationTapSize: 30,
                      changePage: changePage),
                ],
              ),
            ],
          ),
          BoxWidget().filter(
              filter: RoomService().getFilter(),
              filterBoxVisible: filterBoxVisible,
              filterBoxWidth: 260,
              filterBoxHeight: 200),
        ],
      ),
      bottomNavigationBar: BottomNavigation(game: widget.game, currentIndex: 1),
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
  final int maxRoomPerPage = 20;

  late final LobbyWidget pageWidget = LobbyWidget(context: context);
}

class LobbyPage extends StatefulWidget {
  final String game;

  const LobbyPage({Key? key, required this.game}) : super(key: key);

  @override
  State<LobbyPage> createState() => _LobbyPageState();
}
