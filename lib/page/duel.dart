import 'package:flutter/material.dart';
import 'package:project/service/field.dart';
import 'package:project/service/message.dart';
import 'package:project/widget/appBar.dart';
import 'package:project/widget/board.dart';
import 'package:project/widget/chatBox.dart';
import 'play.dart';

class duel extends StatefulWidget {
  const duel({Key? key}) : super(key: key);

  @override
  State<duel> createState() => _duelState();
}

class _duelState extends State<duel> {
  final field _board = field();
  final message _service = message();
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

  void serviceic() {
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
          serviceic,
          _chat,
        ],
      ),
      body: Stack(children: [
        board(
          board: _board.getField(),
        ),
        AnimatedContainer(
          duration: Duration(milliseconds: 400),
          curve: Curves.easeInOut,
          transform: Matrix4.translationValues(_show ? 0 : 200, 0, 0),
          child: ChatBox(log: _service.getLog()),
        ),
      ]),
    );
  }
}
