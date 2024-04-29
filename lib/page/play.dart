import 'package:flutter/material.dart';
import 'package:project/service/room.dart';
import 'package:project/widget/appBar.dart';
import 'package:project/widget/buttomNav.dart';
import 'package:project/widget/room.dart';

class plaYpagE extends StatelessWidget {
  const plaYpagE({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<dynamic> _menu = [
      Icons.add_rounded,
      'Play',
      Icons.filter_list_rounded,
    ];

    void _filter() {}

    void _create() {}

    final rooms _r = rooms(room: 260);

    List<dynamic> _getMenu() => _menu;
    List<Function> _getOnTap() {
      return [
        _create,
        () {},
        _filter,
      ];
    }

    return Scaffold(
      appBar: appBar(
        menu: _getMenu(),
        onTap: _getOnTap(),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                room(room: _r.generate(), page: 30, icon: 6),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: bottomNav(currentIndex: 1),
    );
  }
}
