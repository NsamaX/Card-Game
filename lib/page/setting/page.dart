import 'package:flutter/material.dart';
import 'package:project/widget/appBar.dart';
import 'package:project/widget/buttomNav.dart';
import 'package:project/widget/label.dart';
import 'content.dart';
import 'menu.dart';

class settinGpagE extends StatelessWidget {
  const settinGpagE({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final contenT _c = contenT();
    final menU _m = menU();

    return Scaffold(
      appBar: apPbaR(
        menu: _m.getMenu(),
        onTap: _m.getOnTap(),
      ),
      body: labeL(label: _c.getLabel()),
      bottomNavigationBar: bottoMnaV(currentIndex: 2),
    );
  }
}
