import 'package:flutter/material.dart';
import 'dart:math';
import 'package:project/api/model/cfv.dart';
import 'package:project/service/deck.dart';
import 'package:project/widget/board/field.dart';

class Board extends StatefulWidget {
  final List<dynamic> board;
  final Map<String, dynamic> event;
  final List<dynamic> cardMatrix;
  final Map<String, dynamic> playerHand;
  final double cardSize;

  const Board(
      {Key? key,
      required this.board,
      required this.event,
      required this.cardMatrix,
      required this.playerHand,
      required this.cardSize})
      : super(key: key);

  @override
  State<Board> createState() => _BoardState();
}

class _BoardState extends State<Board> {
  void drag(int col, int row) {
    if (widget.cardMatrix[col][row].isEmpty) return;
    setState(() {
      widget.cardMatrix[col][row].removeLast();
      place(col, row);
    });
  }

  void drop(int col, int row, Model card, bool show) {
    setState(() {
      widget.cardMatrix[col][row].add({'card': card, 'show': show});
      place(col, row);
    });
  }

  void place(int col, int row) {
    setState(() {
      var currentField = widget.board[col][row];
      var currentCard = widget.cardMatrix[col][row];
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
    if (widget.cardMatrix[col][row].isEmpty) return;
    setState(() {
      widget.playerHand['me'].add(widget.cardMatrix[col][row].last['card']);
      widget.cardMatrix[col][row].removeLast();
      place(col, row);
    });
  }

  void flip(int col, int row) {
    if (widget.cardMatrix[col][row].isEmpty) return;
    setState(() {
      widget.cardMatrix[col][row].last['show'] =
          !widget.cardMatrix[col][row].last['show'];
    });
  }

  void load(int col, int row) async {
    final List<Model> loadedDeck = await DeckService().load();
    if (loadedDeck.isEmpty) return;
    List<Model> shuffled = [];
    for (var card in loadedDeck)
      for (int i = 0; i < card.getCount(); i++) shuffled.add(card);
    for (var card in shuffled)
      widget.cardMatrix[col][row].add({'card': card, 'show': false});
    shuffle(20, col, row);
    for (var action in widget.board[col][row]['action']) {
      final bool shouldShowAction =
          action['action'] != 'load' || widget.cardMatrix[col][row].isEmpty;
      action['show'] = shouldShowAction;
    }
    setState(() {});
  }

  void shuffle(int time, int col, int row) {
    if (widget.cardMatrix[col][row].isEmpty) return;
    List<Model> shufflerYet = [];
    List<Model> shuffled = [];
    for (var card in widget.cardMatrix[col][row]) shufflerYet.add(card['card']);
    for (int i = shufflerYet.length; i > 0; i--) {
      final int index = Random().nextInt(i);
      shuffled.add(shufflerYet[index]);
      shufflerYet.removeAt(index);
    }
    widget.cardMatrix[col][row].clear();
    for (var card in shuffled)
      widget.cardMatrix[col][row].add({'card': card, 'show': false});
    if (time > 0) shuffle(time - 1, col, row);
  }

  void use(int col, int row, String action) {
    if (widget.cardMatrix[col][row].isEmpty) return;
    setState(() {
      if (widget.event.containsKey(action)) {
        int targetCol;
        int targetRow;
        switch (action) {
          case 'show' || 'damage':
            final bool isTriggerCard =
                widget.cardMatrix[col][row].last['card'].getType().length > 1;
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
        final cardToMove = widget.cardMatrix[col][row].last['card'];
        widget.cardMatrix[targetCol][targetRow]
            .add({'card': cardToMove, 'show': true});
        widget.cardMatrix[col][row].removeLast();
        place(col, row);
        place(targetCol, targetRow);
      }
    });
  }

  Map<String, dynamic> getOption() => {
        'draw': draw,
        'flip': flip,
        'load': load,
        'shuffle': shuffle,
        'use': use,
      };
  @override
  Widget build(BuildContext context) {
    final FieldWidget fieldWidget =
        FieldWidget(context: context, cardSize: widget.cardSize);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Stack(
        children: [
          fieldWidget.handZone(widget.playerHand['opsite'], false),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int col = 0; col < widget.board.length; col++)
                Row(children: [
                  for (int row = 0; row < widget.board[col].length; row++)
                    fieldWidget.field(col, row, widget.board, widget.cardMatrix,
                        getOption(), drag, drop),
                ]),
            ],
          ),
          fieldWidget.handZone(widget.playerHand['me'], true),
        ],
      ),
    );
  }
}
