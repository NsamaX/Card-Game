import 'package:flutter/material.dart';
import 'package:project/service/room.dart';
import 'package:project/widget/appBar.dart';
import 'package:project/widget/buttomNav.dart';
import 'package:project/widget/room.dart';

class play extends StatelessWidget {
  const play({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final rooms _r = rooms(room: 260);

    void _filter() {}

    void _create() {}

    return Scaffold(
      appBar: appBar(
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
                room(room: _r.getRoom(), page: 30, icon: 6),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: bottomNav(currentIndex: 1),
    );
  }
}
