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
  final List<IconData> _communicationIcon = [
    Icons.headset_off_rounded,
    Icons.headset_rounded,
    Icons.headset_mic_rounded,
  ];
  int _communicationType = 0;
  bool _showChat = false;

  late List<dynamic> _board;
  late List<dynamic> _cardMatrix;
  late Map<String, dynamic> _event = {
    'bind': {},
    'damage': {},
    'drop': {},
    'guard': {},
    'show': {},
    'special': {},
    'trigger': {},
  };
  Map<String, dynamic> _hand = {'opsite': [], 'me': []};

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

  void _chat() {
    setState(() {
      _showChat = !_showChat;
    });
  }

  @override
  void initState() {
    super.initState();
    _board = Field().getField();
    _cardMatrix = [];
    for (int col = 0; col < _board.length; col++) {
      List<dynamic> column = [];
      for (int row = 0; row < _board[col].length; row++) {
        column.add([]);
        final String name = _board[col][row]['field']['event'] ?? 'none';
        if (_event.containsKey(name)) _event[name] = {'col': col, 'row': row};
      }
      _cardMatrix.add(column);
    }
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
          _chat,
        ],
      ),
      body: Stack(children: [
        Board(
          board: _board,
          event: _event,
          cardMatrix: _cardMatrix,
          hand: _hand,
        ),
        AnimatedContainer(
          duration: Duration(milliseconds: 400),
          curve: Curves.easeInOut,
          transform: Matrix4.translationValues(_showChat ? 0 : 200, 0, 0),
          child: ChatBox(log: Message().getLog()),
        ),
      ]),
    );
  }
}
