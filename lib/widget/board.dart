import 'dart:math';
import 'package:flutter/material.dart';
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
  final _size = 80.0;

  void _load(int col, int row) {
    _service.load().then(
      (deck) {
        setState(() {
          List<model> _deck = deck;
          List<model> _suit = [];
          for (var card in _deck)
            for (int i = 0; i < card.getCount(); i++) _suit.add(card);
          _shuffle(10, col, row, _suit);
        });
      },
    );
  }

  void _shuffle(int time, int col, int row, List<model> suit) {
    List<model> shuffle = [];
    Random random = Random();
    for (int i = suit.length; i > 0; i--) {
      int idex = random.nextInt(i);
      shuffle.add(suit[idex]);
      suit.removeAt(idex);
    }
    if (time > 0)
      _shuffle(time - 1, col, row, shuffle);
    else
      _card[col][row]['card'] = shuffle;
  }

  void _drag(int col, int row) {
    setState(() {
      _card[col][row]['card'].removeAt(_card[col][row]['card'].length - 1);
    });
  }

  void _place(int col, int row, model card) {
    setState(() {
      _card[col][row]['card'].add(card);
      _card[col][row]['show'] = true;
    });
  }

  @override
  void initState() {
    super.initState();
    for (int col = 0; col < widget._board.length; col++) {
      List<dynamic> _column = [];
      for (int row = 0; row < widget._board[col].length; row++)
        _column.add({'card': [], 'show': false});
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
    final String _name = _field['field']['name'];
    final List<dynamic> _action = _field['action'];
    final Map<String, dynamic> _data = _card[col][row];

    return Expanded(
      child: Stack(
        children: [
          DragTarget(
            onAccept: (dynamic card) => _place(col, row, card),
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
                      _name,
                      style: themeData().textTheme.bodySmall?.copyWith(
                          color: themeData().iconTheme.color!.withOpacity(0.6)),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
          ),
          if (_data['card'] != null)
            for (var card in _data['card'])
              Draggable(
                  child: DragTarget(
                      onAccept: (dynamic card) => _place(col, row, card),
                      builder: (context, candidateData, rejectedData) =>
                          CARD(card: card, show: _data['show'], build: false)),
                  data: card,
                  feedback: Container(
                    height: _size * 1.2,
                    child: CARD(card: card, show: _data['show'], build: false),
                  ),
                  childWhenDragging: Container(),
                  onDraggableCanceled: (velocity, offset) {
                    _place(col, row, card);
                  },
                  onDragEnd: (dragDetails) {
                    _drag(col, row);
                  }),
          action(col: col, row: row, action: _load, onTap: _action),
        ],
      ),
    );
  }
}
