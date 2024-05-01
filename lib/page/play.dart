import 'package:flutter/material.dart';
import 'package:project/service/room.dart';
import 'package:project/widget/appBar.dart';
import 'package:project/widget/buttomNav.dart';
import 'package:project/widget/lobby.dart';

class PlayPage extends StatelessWidget {
  const PlayPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final room _service = room(room: 260);

    void _filter() {}

    void _create() {}

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
                    room: _service.getRoom(),
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
