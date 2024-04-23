import 'package:flutter/material.dart';
import 'package:project/widget/appBar.dart';
import 'package:project/widget/buttomNav.dart';
import 'package:project/widget/room.dart';
import 'contents.dart';
import 'menu.dart';

class plaYpagE extends StatefulWidget {
  const plaYpagE({Key? key}) : super(key: key);

  @override
  State<plaYpagE> createState() => _plaYpagEState();
}

class _plaYpagEState extends State<plaYpagE> {
  @override
  Widget build(BuildContext context) {
    final contenT _c = contenT();
    final menU _m = menU();

    return Scaffold(
      appBar: apPbaR(
        menu: _m.getMenu(),
        onTap: _m.getOnTap(),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                rooM(
                    room: _c.getRoom(), page: _c.getPage(), icon: _c.getIcon()),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: bottoMnaV(currentIndex: 1),
    );
  }
}
