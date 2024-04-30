import 'package:flutter/material.dart';
import 'package:project/service/board.dart';
import 'package:project/service/message.dart';
import 'package:project/widget/appBar.dart';
import 'package:project/widget/buttomNav.dart';
import 'package:project/widget/chatBox.dart';
import 'package:project/widget/field.dart';
import 'play.dart';

class duel extends StatefulWidget {
  const duel({Key? key}) : super(key: key);

  @override
  State<duel> createState() => _duelState();
}

class _duelState extends State<duel> {
  bool _onHeadphone = false;
  bool _onMicrophone = false;
  bool _show = false;

  void _back() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => play()),
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

  @override
  Widget build(BuildContext context) {
    final board _b = board();
    final message _c = message();

    return Scaffold(
      appBar: appBar(
        menu: [
          Icons.arrow_back_rounded,
          _onHeadphone ? Icons.headset_rounded : Icons.headset_off_rounded,
          'Room ID',
          _onMicrophone ? Icons.mic_rounded : Icons.mic_off_rounded,
          Icons.chat_rounded,
        ],
        onTap: [
          _back,
          _head,
          () {},
          _mic,
          _chat,
        ],
      ),
      body: Stack(children: [
        field(
          field: _b.getField(),
        ),
        AnimatedContainer(
          duration: Duration(milliseconds: 400),
          curve: Curves.easeInOut,
          transform: Matrix4.translationValues(_show ? 0 : 200, 0, 0),
          child: chatBox(log: _c.getLog()),
        ),
      ]),
      bottomNavigationBar: bottomNav(currentIndex: 1),
    );
  }
}
