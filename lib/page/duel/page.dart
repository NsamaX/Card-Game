import 'package:flutter/material.dart';
import 'package:project/api/service/message.dart';
import 'package:project/widget/appBar.dart';
import 'package:project/widget/board.dart';
import 'package:project/widget/buttomNav.dart';
import 'package:project/widget/chat.dart';
import 'contents.dart';
import 'menu.dart';

class dueLpagE extends StatefulWidget {
  const dueLpagE({Key? key}) : super(key: key);

  @override
  State<dueLpagE> createState() => _dueLpagEState();
}

class _dueLpagEState extends State<dueLpagE> {
  bool _show = false;

  void _draw() {
    setState(() {
      _show = !_show;
    });
  }

  @override
  Widget build(BuildContext context) {
    final messagE _s = messagE();
    final contenT _c = contenT();
    final menU _m = menU(context: context, draw: _draw);

    return Scaffold(
      appBar: apPbaR(
        menu: _m.getMenu(),
        onTap: _m.getOnTap(),
      ),
      body: Stack(children: [
        boarD(
          board: _c.getField(),
        ),
        AnimatedContainer(
          duration: Duration(milliseconds: 400),
          curve: Curves.easeInOut,
          transform: Matrix4.translationValues(_show ? 0 : 200, 0, 0),
          child: chaT(message: _s.getMessage()),
        ),
      ]),
      bottomNavigationBar: bottoMnaV(currentIndex: 1),
    );
  }
}
