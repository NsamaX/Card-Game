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

  final List<IconData> _communicationIcon = [
    Icons.headset_off_rounded,
    Icons.headset_rounded,
    Icons.headset_mic_rounded,
  ];
  int _communicationType = 0;
  bool _showChat = false;

  void _back() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LobbyPage()),
    );
  }

  void _communication() {
    setState(() {
      if (_communicationType < _communicationIcon.length - 1)
        _communicationType++;
      else
        _communicationType = 0;
    });
  }

  void _message() {
    setState(() {
      _showChat = !_showChat;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        menu: [
          Icons.arrow_back_rounded,
          Icons.info_outline_rounded,
          'Room ID',
          _communicationIcon[_communicationType],
          Icons.chat_rounded,
        ],
        onTap: [
          _back,
          () {},
          () {},
          _communication,
          _message,
        ],
      ),
      body: Stack(children: [
        Board(
          board: _fieldService.getField(),
        ),
        AnimatedContainer(
          duration: Duration(milliseconds: 400),
          curve: Curves.easeInOut,
          transform: Matrix4.translationValues(_showChat ? 0 : 200, 0, 0),
          child: ChatBox(log: _messageService.getLog()),
        ),
      ]),
    );
  }
}
