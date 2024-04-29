import 'package:flutter/material.dart';
import 'package:project/widget/appBar.dart';
import 'package:project/widget/buttomNav.dart';
import 'package:project/widget/room.dart';
import 'contents.dart';
import 'menu.dart';

class plaYpagE extends StatelessWidget {
  const plaYpagE({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final contenT _c = contenT();
    final menU _m = menU();

    return Scaffold(
      appBar: appBar(
        menu: _m.getMenu(),
        onTap: _m.getOnTap(),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                room(
                    room: _c.getRoom(), page: 30, icon: 6),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: bottoMnaV(currentIndex: 1),
    );
  }
}
