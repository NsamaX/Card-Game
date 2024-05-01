import 'package:flutter/material.dart';
import 'package:project/service/room.dart';
import 'package:project/widget/appBar.dart';
import 'package:project/widget/buttomNav.dart';
import 'package:project/widget/lobby.dart';

class LobbyPage extends StatelessWidget {
  void _filter() {}

  void _create() {}

  const LobbyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        menu: [
          Icons.add_rounded,
          'Play',
          Icons.filter_list_rounded,
        ],
        onTap: [
          _create,
          () {},
          _filter,
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Lobby(
                    room: Room().getRoom(260),
                    maxRoomPerPage: 30,
                    maxNavigationTap: 6),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigation(currentIndex: 1),
    );
  }
}
