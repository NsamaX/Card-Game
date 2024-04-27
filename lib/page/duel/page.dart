import 'package:flutter/material.dart';
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
  bool _onHeadphone = false;
  bool _onMicrophone = false;
  bool _show = false;

  void _head() {
    setState(() {
      _onHeadphone = !_onHeadphone;
    });
  }

  void _mic() {
    setState(() {
      _onMicrophone = !_onMicrophone;
    });
  }

  void _draw() {
    setState(() {
      _show = !_show;
    });
  }

  @override
  Widget build(BuildContext context) {
    final contenT _c = contenT();
    final menU _m = menU(
      context: context,
      headphone: _head,
      onHeadphone: _onHeadphone,
      microphone: _mic,
      onMicrophone: _onMicrophone,
      draw: _draw,
    );

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
          child: chaT(message: _c.getMessage()),
        ),
      ]),
      bottomNavigationBar: bottoMnaV(currentIndex: 1),
    );
  }
}
