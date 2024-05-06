import 'package:flutter/material.dart';
import 'dart:math';
import 'package:project/api/model/model.dart';
import 'package:project/api/service/deck.dart';
import 'package:project/widget/board/field.dart';

class _BoardState extends State<Board> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int col = 0; col < widget.board.length; col++)
                Row(children: [
                  for (int row = 0; row < widget.board[col].length; row++)
                    fieldWidget.field(
                        col: col, row: row, cardOnBoard: widget.cardOnBoard),
                ]),
            ],
          ),
          fieldWidget.handZone(playerHand: widget.playerHand['opposite']),
          fieldWidget.handZone(playerHand: widget.playerHand['me']),
        ],
      ),
    );
  }

  void drag(int col, int row) {
    if (widget.cardOnBoard[col][row].isEmpty) return;
    setState(() {
      widget.cardOnBoard[col][row].removeLast();
      update(col, row);
    });
  }

  void drop(int col, int row, Model card, bool show) {
    setState(() {
      final int targetCol = widget.event['show']['col'];
      final int targetRow = widget.event['show']['row'];
      final bool isShow = targetCol == col && targetRow == row;
      widget.cardOnBoard[col][row]
          .add({'card': card, 'show': isShow ? true : show});
      update(col, row);
    });
  }

  void update(int col, int row) {
    setState(() {
      var currentField = widget.board[col][row];
      var currentCard = widget.cardOnBoard[col][row];
      for (var action in currentField['action']) {
        switch (action['action']) {
          case 'load':
            action['show'] = currentCard.isEmpty;
            break;
          case 'search':
          case 'shuffle':
            action['show'] = currentCard.length > 1;
            break;
          default:
            action['show'] = currentCard.isNotEmpty;
            break;
        }
      }
    });
  }

  void draw(int col, int row) {
    if (widget.cardOnBoard[col][row].isEmpty) return;
    final String player = 'me';
    setState(() {
      widget.playerHand[player]['card'].add({
        'card': widget.cardOnBoard[col][row].last['card'],
        'show': widget.cardOnBoard[col][row].last['show']
      });
      if (player == 'me') widget.playerHand[player]['card'].last['show'] = true;
      widget.cardOnBoard[col][row].removeLast();
      update(col, row);
    });
  }

  void place(String player, int index) {
    setState(() {
      widget.playerHand[player]['card'].removeAt[index];
    });
  }

  void use(int col, int row, String action) {
    if (widget.cardOnBoard[col][row].isEmpty) return;
    setState(() {
      if (widget.event.containsKey(action)) {
        late final int targetCol;
        late final int targetRow;
        switch (action) {
          case 'show' || 'damage':
            final bool isTriggerCard =
                widget.cardOnBoard[col][row].last['card'].getMap()['Trigger'] !=
                        null
                    ? true
                    : false;
            targetCol = isTriggerCard
                ? widget.event['trigger']['col']
                : widget.event[action]['col'];
            targetRow = isTriggerCard
                ? widget.event['trigger']['row']
                : widget.event[action]['row'];
            break;
          default:
            targetCol = widget.event[action]['col'];
            targetRow = widget.event[action]['row'];
            break;
        }
        final cardToMove = widget.cardOnBoard[col][row].last['card'];
        widget.cardOnBoard[targetCol][targetRow]
            .add({'card': cardToMove, 'show': true});
        widget.cardOnBoard[col][row].removeLast();
        update(col, row);
        update(targetCol, targetRow);
      }
    });
  }

  void flip(int col, int row) {
    if (widget.cardOnBoard[col][row].isEmpty) return;
    setState(() {
      widget.cardOnBoard[col][row].last['show'] =
          !widget.cardOnBoard[col][row].last['show'];
    });
  }

  void load(int col, int row) async {
    final List<Model> loadedDeck = await DeckService().load(game: widget.game);
    if (loadedDeck.isEmpty) return;
    List<Model> shuffled = [];
    for (var card in loadedDeck)
      for (int i = 0; i < card.getCount(); i++) shuffled.add(card);
    for (var card in shuffled)
      widget.cardOnBoard[col][row].add({'card': card, 'show': false});
    shuffle(20, col, row);
    for (var action in widget.board[col][row]['action']) {
      final bool shouldShowAction =
          action['action'] != 'load' || widget.cardOnBoard[col][row].isEmpty;
      action['show'] = shouldShowAction;
    }
    setState(() {});
  }

  void shuffle(int time, int col, int row) {
    if (widget.cardOnBoard[col][row].isEmpty) return;
    List<Model> shufflerYet = [];
    List<Model> shuffled = [];
    for (var card in widget.cardOnBoard[col][row])
      shufflerYet.add(card['card']);
    for (int i = shufflerYet.length; i > 0; i--) {
      final int index = Random().nextInt(i);
      shuffled.add(shufflerYet[index]);
      shufflerYet.removeAt(index);
    }
    widget.cardOnBoard[col][row].clear();
    for (var card in shuffled)
      widget.cardOnBoard[col][row].add({'card': card, 'show': false});
    if (time > 0)
      shuffle(time - 1, col, row);
    else
      setState(() {});
    ;
  }

  Map<String, dynamic> getOption() => {
        'draw': draw,
        'use': use,
        'flip': flip,
        'load': load,
        'shuffle': shuffle,
      };

  late final FieldWidget fieldWidget = FieldWidget(
      context: context,
      board: widget.board,
      option: getOption(),
      drag: drag,
      drop: drop,
      place: place,
      cardHeight: widget.cardHeight);
}

class Board extends StatefulWidget {
  final String game;
  final List<dynamic> board;
  final Map<String, dynamic> event;
  final List<dynamic> cardOnBoard;
  final Map<String, dynamic> playerHand;
  final double cardHeight;

  const Board(
      {Key? key,
      required this.game,
      required this.board,
      required this.event,
      required this.cardOnBoard,
      required this.playerHand,
      required this.cardHeight})
      : super(key: key);

  @override
  State<Board> createState() => _BoardState();
}
