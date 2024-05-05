// TODO: create function for communicate

import 'package:flutter/material.dart';
import 'package:project/page/lobby.dart';
import 'package:project/service/board/board.dart';
import 'package:project/service/message.dart';
import 'package:project/widget/board/board.dart';
import 'package:project/widget/box/box.dart';
import 'package:project/widget/appBar.dart';

class _PlayPageState extends State<PlayPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        menuItem: [
          Icons.arrow_back_rounded,
          Icons.help_outline_rounded,
          'Room ${widget.roomID.toString()}',
          communicationIcon[communicationType],
          Icons.chat_rounded
        ],
        onTapmenuItem: [back, help, null, communication, chat],
      ),
      body: Stack(
        children: [
          Board(
              board: board,
              event: event,
              cardOnBoard: cardOnBoard,
              playerHand: playerHand,
              cardHeight: 80),
          Box().help([], helpBoxVisible, 260, 360),
          Box().chat(
              MessageService().getLog(), chatBoxVisible, 260, 360, 16, 40),
        ],
      ),
    );
  }

  void back() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LobbyPage()),
    );
  }

  void help() {
    setState(() {
      helpBoxVisible = !helpBoxVisible;
    });
  }

  void chat() {
    setState(() {
      chatBoxVisible = !chatBoxVisible;
    });
  }

  void communication() {
    setState(() {
      if (communicationType < communicationIcon.length - 1)
        communicationType++;
      else
        communicationType = 0;
    });
  }

  @override
  void initState() {
    super.initState();
    board = BoardService(game: widget.game, format: widget.format).getField();
    event = BoardService(game: widget.game, format: widget.format).getEvent();
    cardOnBoard = [];
    for (int col = 0; col < board.length; col++) {
      List<dynamic> column = [];
      for (int row = 0; row < board[col].length; row++) {
        column.add([]);
        final String name = board[col][row]['field']['event'] ?? 'none';
        if (event.containsKey(name)) event[name] = {'col': col, 'row': row};
      }
      cardOnBoard.add(column);
    }
  }

  final List<IconData> communicationIcon = [
    Icons.headset_off_rounded,
    Icons.headset_rounded,
    Icons.headset_mic_rounded
  ];
  int communicationType = 0;
  bool helpBoxVisible = false;
  bool chatBoxVisible = false;

  late final List<dynamic> board;
  late final Map<String, dynamic> event;
  late List<dynamic> cardOnBoard;
  Map<String, dynamic> playerHand = {
    'me': {'type': 'me', 'card': []},
    'opposite': {'type': 'opposite', 'card': []}
  };
}

class PlayPage extends StatefulWidget {
  final int roomID;
  final String game;
  final String format;

  const PlayPage(
      {Key? key,
      required this.roomID,
      required this.game,
      required this.format})
      : super(key: key);

  @override
  State<PlayPage> createState() => _PlayPageState();
}
