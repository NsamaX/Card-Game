import 'package:flutter/material.dart';
import 'package:project/service/field.dart';
import 'package:project/service/message.dart';
import 'package:project/widget/appBar.dart';
import 'package:project/widget/board.dart';
import 'package:project/widget/chatBox.dart';
import 'lobby.dart';

class PlayPage extends StatefulWidget {
  const PlayPage({Key? key}) : super(key: key);

  @override
  State<PlayPage> createState() => _PlayPageState();
}

class _PlayPageState extends State<PlayPage> {
  final Field _fieldService = Field();
  final Message _messageService = Message();

  bool _onHeadphone = false;
  bool _onMicrophone = false;
  bool _show = false;

  void _back() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LobbyPage()),
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
      appBar: CustomAppBar(
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
        Board(
          board: _fieldService.getField(),
        ),
        AnimatedContainer(
          duration: Duration(milliseconds: 400),
          curve: Curves.easeInOut,
          transform: Matrix4.translationValues(_show ? 0 : 200, 0, 0),
          child: ChatBox(log: _messageService.getLog()),
        ),
      ]),
    );
  }
}
