import 'package:flutter/material.dart';
import 'dart:math';
import 'package:project/api/model.dart';
import 'package:project/service/deck.dart';
import 'card.dart';
import 'moveList.dart';

// ignore: must_be_immutable
class Board extends StatefulWidget {
  final List<dynamic> _board;
  final Map<String, dynamic> _event;
  final List<dynamic> _cardMatrix;
  final Map<String, dynamic> _hand;

  const Board(
      {Key? key,
      required List<dynamic> board,
      required Map<String, dynamic> event,
      required List<dynamic> cardMatrix,
      required Map<String, dynamic> hand})
      : _board = board,
        _event = event,
        _cardMatrix = cardMatrix,
        _hand = hand,
        super(key: key);

  @override
  State<Board> createState() => _BoardState();
}

class _BoardState extends State<Board> {
  final double _cardSize = 80.0;

  void _drag(int col, int row) {
    setState(() {
      if (widget._cardMatrix[col][row].isNotEmpty) {
        widget._cardMatrix[col][row].removeLast();
        _place(col, row);
      }
    });
  }

  void _drop(int col, int row, Model card, bool show) {
    setState(() {
      widget._cardMatrix[col][row].add({'card': card, 'show': show});
      _place(col, row);
    });
  }

  void _place(int col, int row) {
    setState(() {
      var currentField = widget._board[col][row];
      var currentCard = widget._cardMatrix[col][row];
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

  void _flip(int col, int row) {
    setState(() {
      if (widget._cardMatrix[col][row].isNotEmpty)
        widget._cardMatrix[col][row].last['show'] =
            !widget._cardMatrix[col][row].last['show'];
    });
  }

  void _load(int col, int row) async {
    final List<Model> loadedDeck = await Deck().load();
    if (loadedDeck.isNotEmpty) {
      List<Model> shuffled = [];
      for (var card in loadedDeck)
        for (int i = 0; i < card.getCount(); i++) shuffled.add(card);
      for (var card in shuffled)
        widget._cardMatrix[col][row].add({'card': card, 'show': false});
      _shuffle(20, col, row);
      for (var action in widget._board[col][row]['action']) {
        bool shouldShowAction =
            action['action'] != 'load' || widget._cardMatrix[col][row].isEmpty;
        action['show'] = shouldShowAction;
      }
    }
    setState(() {});
  }

  void _shuffle(int time, int col, int row) {
    List<Model> shufflerYet = [];
    List<Model> shuffled = [];
    for (var card in widget._cardMatrix[col][row])
      shufflerYet.add(card['card']);
    for (int i = shufflerYet.length; i > 0; i--) {
      int index = Random().nextInt(i);
      shuffled.add(shufflerYet[index]);
      shufflerYet.removeAt(index);
    }
    widget._cardMatrix[col][row].clear();
    for (var card in shuffled)
      widget._cardMatrix[col][row].add({'card': card, 'show': false});
    if (time > 0) _shuffle(time - 1, col, row);
  }

  void _use(int col, int row, String action) {
    setState(() {
      if (widget._event.containsKey(action)) {
        int targetCol;
        int targetRow;
        switch (action) {
          case 'show' || 'damage':
            final bool isTriggerCard =
                widget._cardMatrix[col][row].last['card'].getType().length > 1;
            targetCol = isTriggerCard
                ? widget._event['trigger']['col']
                : widget._event[action]['col'];
            targetRow = isTriggerCard
                ? widget._event['trigger']['row']
                : widget._event[action]['row'];
            break;
          default:
            targetCol = widget._event[action]['col'];
            targetRow = widget._event[action]['row'];
            break;
        }
        final cardToMove = widget._cardMatrix[col][row].last['card'];
        widget._cardMatrix[targetCol][targetRow]
            .add({'card': cardToMove, 'show': true});
        widget._cardMatrix[col][row].removeLast();
        _place(col, row);
        _place(targetCol, targetRow);
      }
    });
  }

  Map<String, dynamic> _getOption() => {
        'flip': _flip,
        'load': _load,
        'shuffle': _shuffle,
        'use': _use,
      };

  @override
  Widget build(BuildContext context) {
    final ThemeData _theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _handZone(_theme, widget._hand['opsite']),
          for (int col = 0; col < widget._board.length; col++)
            Row(children: [
              for (int row = 0; row < widget._board[col].length; row++)
                _completeField(_theme, col, row),
            ]),
          _handZone(_theme, widget._hand['me']),
        ],
      ),
    );
  }

  Widget _completeField(ThemeData theme, int col, int row) {
    final Map<String, dynamic> _field = widget._board[col][row];

    return Expanded(
      child: Stack(
        children: [
          DragTarget(
            onAccept: (dynamic card) =>
                _drop(col, row, card['card'], card['show']),
            builder: (context, candidateData, rejectedData) =>
                _virsualField(theme, _field),
          ),
          if (widget._cardMatrix[col][row].isNotEmpty)
            for (var card in widget._cardMatrix[col][row])
              Draggable(
                child: DragTarget(
                  onAccept: (dynamic card) =>
                      _drop(col, row, card['card'], card['show']),
                  builder: (context, candidateData, rejectedData) => CARD(
                    card: card['card'],
                    save: false,
                    show: card['show'],
                    info: card['show'],
                  ),
                ),
                data: card,
                feedback: SizedBox(
                  height: _cardSize * 1.2,
                  child: CARD(
                    card: card['card'],
                    save: false,
                    show: card['show'],
                    info: card['show'],
                  ),
                ),
                onDraggableCanceled: (velocity, offset) =>
                    _drop(col, row, card['card'], false),
                onDragEnd: (dragDetails) => _drag(col, row),
              ),
          MoveList(
            col: col,
            row: row,
            option: _getOption(),
            action: _field['action'],
          ),
        ],
      ),
    );
  }

  Widget _virsualField(ThemeData theme, Map<String, dynamic> field) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RotatedBox(
        quarterTurns: field['field']['type'],
        child: Container(
          width: _cardSize,
          height: _cardSize,
          decoration: BoxDecoration(
            color: theme.appBarTheme.backgroundColor,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Center(
            child: Text(
              field['field']['name'],
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.iconTheme.color!.withOpacity(0.6),
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }

  Widget _handZone(ThemeData theme, List<dynamic> hand) {
    return Expanded(
        child: Container(
      height: _cardSize,
      color: Colors.white,
      child: hand.isNotEmpty
          ? Row(
              children: hand.map((card) => _virsualField(theme, card)).toList(),
            )
          : SizedBox(),
    ));
  }
}
