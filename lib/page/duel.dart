import 'package:flutter/material.dart';
import 'play.dart';
import 'package:project/service/board.dart';
import 'package:project/service/message.dart';
import 'package:project/widget/appBar.dart';
import 'package:project/widget/buttomNav.dart';
import 'package:project/widget/chat.dart';
import 'package:project/widget/field.dart';

class duel extends StatefulWidget {
  const duel({Key? key}) : super(key: key);

  @override
  State<duel> createState() => _duelState();
}

class _duelState extends State<duel> {
  final List<dynamic> _menu = [
    Icons.arrow_back_rounded,
    null,
    'Room ID',
    null,
    Icons.chat_rounded,
  ];
  bool _onHeadphone = false;
  bool _onMicrophone = false;
  bool _show = false;

  void _back() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => plaYpagE()),
    );
  }

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

  void _chat() {
    setState(() {
      _show = !_show;
    });
  }

  List<dynamic> _getMenu() {
    if (_onHeadphone)
      _menu[1] = Icons.headset_rounded;
    else
      _menu[1] = Icons.headset_off_rounded;
    if (_onMicrophone)
      _menu[3] = Icons.mic_rounded;
    else
      _menu[3] = Icons.mic_off_rounded;
    return _menu;
  }

  List<Function> _getOnTap() {
    return [
      _back,
      _head,
      () {},
      _mic,
      _chat,
    ];
  }

  @override
  Widget build(BuildContext context) {
    final board _b = board();
    final message _c = message();

    return Scaffold(
      appBar: appBar(
        menu: _getMenu(),
        onTap: _getOnTap(),
      ),
      body: Stack(children: [
        field(
          field: _b.getField(),
        ),
        AnimatedContainer(
          duration: Duration(milliseconds: 400),
          curve: Curves.easeInOut,
          transform: Matrix4.translationValues(_show ? 0 : 200, 0, 0),
          child: chat(message: _c.getMessage()),
        ),
      ]),
      bottomNavigationBar: bottomNav(currentIndex: 1),
    );
  }
}
