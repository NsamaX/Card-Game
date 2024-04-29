import 'package:flutter/material.dart';
import 'dart:math';
import 'package:project/api/model.dart';
import 'package:project/service/deck.dart';
import 'action.dart';
import 'card.dart';
import 'theme.dart';

class board extends StatefulWidget {
  final List<dynamic> _board;

  const board({Key? key, required List<dynamic> board})
      : _board = board,
        super(key: key);

  @override
  State<board> createState() => _boardState();
}

class _boardState extends State<board> {
  final decK _service = decK();
  late List<dynamic> _card = [];

  void _drag(int col, int row) {
    setState(() {
      if (_card[col][row].isNotEmpty) {
        _card[col][row].removeLast();
      }
    });
  }

  void _drop(int col, int row, model card) {
    setState(() {
      _card[col][row].add({'card': card, 'show': true});
    });
  }

  void _load(int col, int row) {
    _service.load().then(
      (deck) {
        setState(() {
          List<model> _deck = deck;
          List<model> _suit = [];
          for (var card in _deck)
            for (int i = 0; i < card.getCount(); i++) _suit.add(card);
          _shuffle(20, col, row, _suit);
        });
      },
    );
  }

  void _shuffle(int time, int col, int row, List<model> suit) {
    final Random _random = Random();
    List<model> shuffle = [];
    for (int i = suit.length; i > 0; i--) {
      int idex = _random.nextInt(i);
      shuffle.add(suit[idex]);
      suit.removeAt(idex);
    }
    if (time > 0)
      _shuffle(time - 1, col, row, shuffle);
    else
      for (var card in shuffle)
        _card[col][row].add({'card': card, 'show': false});
  }

  void _flip(int col, int row) {
    setState(() {
      if (_card[col][row].isNotEmpty) {
        _card[col][row].last['show'] = !_card[col][row].last['show'];
      }
    });
  }

  Map<String, dynamic> _getAction() => {
        'load': _load,
        'flip': _flip,
      };

  @override
  void initState() {
    super.initState();
    for (int col = 0; col < widget._board.length; col++) {
      List<dynamic> _column = [];
      for (int row = 0; row < widget._board[col].length; row++) _column.add([]);
      _card.add(_column);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 36.0, horizontal: 10.0),
      child: ListView.builder(
        itemCount: widget._board.length,
        itemBuilder: (context, col) {
          return Column(
            children: [
              Row(children: [
                for (int row = 0; row < widget._board[col].length; row++)
                  _field(col, row)
              ]),
            ],
          );
        },
      ),
    );
  }

  Widget _field(int col, int row) {
    final Map<String, dynamic> _field = widget._board[col][row];
    final _size = 80.0;

    return Expanded(
      child: Stack(
        children: [
          DragTarget(
            onAccept: (dynamic card) => _drop(col, row, card['card']),
            builder: (context, candidateData, rejectedData) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: RotatedBox(
                quarterTurns: _field['field']['type'] * 3,
                child: Container(
                  width: _size,
                  height: _size,
                  decoration: BoxDecoration(
                    color: themeData().appBarTheme.backgroundColor,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Center(
                    child: Text(
                      _field['field']['name'],
                      style: themeData().textTheme.bodySmall?.copyWith(
                          color: themeData().iconTheme.color!.withOpacity(0.6)),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
          ),
          if (_card[col][row].length > 0)
            for (var card in _card[col][row])
              Draggable(
                  child: DragTarget(
                      onAccept: (dynamic card) => _drop(col, row, card['card']),
                      builder: (context, candidateData, rejectedData) => CARD(
                          card: card['card'],
                          show: card['show'],
                          info: card['show'],
                          build: false)),
                  data: card,
                  feedback: Container(
                    height: _size * 1.2,
                    child: CARD(
                        card: card['card'],
                        show: card['show'],
                        info: card['show'],
                        build: false),
                  ),
                  childWhenDragging: Container(),
                  onDraggableCanceled: (velocity, offset) {
                    _drop(col, row, card['card']);
                  },
                  onDragEnd: (dragDetails) {
                    _drag(col, row);
                  }),
          action(
              col: col,
              row: row,
              action: _getAction(),
              onTap: _field['action']),
        ],
      ),
    );
  }
}
