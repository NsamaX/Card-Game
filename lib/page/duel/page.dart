import 'package:flutter/material.dart';
import 'package:project/widget/appBar.dart';
import 'package:project/widget/board.dart';
import 'package:project/widget/buttomNav.dart';
import 'contents.dart';
import 'menu.dart';

class dueLpagE extends StatelessWidget {
  const dueLpagE({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final contenT _c = contenT();
    final menU _m = menU(context: context);

    return Scaffold(
      appBar: apPbaR(
        menu: _m.getMenu(),
        onTap: _m.getOnTap(),
      ),
      body: boarD(
        field: _c.getField(),
      ),
      bottomNavigationBar: bottoMnaV(currentIndex: 1),
    );
  }
}
