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
  final deck _service = deck();
  final Random _random = Random();
  Map<String, dynamic> _event = {
    'bind': {},
    'damage': {},
    'drop': {},
    'guard': {},
    'show': {},
    'special': {},
    'trigger': {},
  };
  List<dynamic> _card = [];
  final _size = 80.0;

  void _drag(int col, int row) {
    setState(() {
      if (_card[col][row].isNotEmpty) {
        _card[col][row].removeLast();
        _place(col, row);
      }
    });
  }

  void _drop(int col, int row, model card, bool show) {
    setState(() {
      _card[col][row].add({'card': card, 'show': show});
      _place(col, row);
    });
  }

  void _place(int col, int row) {
    setState(() {
      var currentField = widget._board[col][row];
      var currentCard = _card[col][row];
      for (var action in currentField['action']) {
        switch (action['action']) {
          case 'load':
            action['show'] = currentCard.isEmpty;
            break;
          case 'search' || 'shuffle':
            action['show'] = currentCard.length > 1;
            break;
          default:
            action['show'] = currentCard.isNotEmpty;
            break;
        }
      }
    });
  }

  void _use(int col, int row, String action) {
    setState(() {
      if (_event.containsKey(action)) {
        final bool isTriggerCard =
            _card[col][row].last['card'].getType().length > 1;
        final int _col =
            isTriggerCard ? _event['trigger']['col'] : _event[action]['col'];
        final int _row =
            isTriggerCard ? _event['trigger']['row'] : _event[action]['row'];
        final cardToMove = _card[col][row].last['card'];
        _card[_col][_row].add({'card': cardToMove, 'show': true});
        _card[col][row].removeLast();
        _place(col, row);
        _place(_col, _row);
      }
    });
  }

  void _flip(int col, int row) {
    setState(() {
      if (_card[col][row].isNotEmpty)
        _card[col][row].last['show'] = !_card[col][row].last['show'];
    });
  }

  void _load(int col, int row) async {
    final List<model> _loadedDeck = await _service.load();
    if (_loadedDeck.isEmpty) return;
    List<model> _shuffled = [];
    for (var card in _loadedDeck)
      for (int i = 0; i < card.getCount(); i++) _shuffled.add(card);
    for (var card in _shuffled) {
      _card[col][row].add({'card': card, 'show': false});
    }
    _shuffle(20, col, row);
    for (var action in widget._board[col][row]['action']) {
      bool shouldShowAction =
          action['action'] != 'load' || _card[col][row].isEmpty;
      action['show'] = shouldShowAction;
    }
    setState(() {});
  }

  void _shuffle(int time, int col, int row) {
    List<model> _shufflerYet = [];
    for (var card in _card[col][row]) _shufflerYet.add(card['card']);
    List<model> _shuffled = [];
    for (int i = _shufflerYet.length; i > 0; i--) {
      int index = _random.nextInt(i);
      _shuffled.add(_shufflerYet[index]);
      _shufflerYet.removeAt(index);
    }
    _card[col][row].clear();
    for (var card in _shuffled)
      _card[col][row].add({'card': card, 'show': false});
    if (time > 0) _shuffle(time - 1, col, row);
  }

  Map<String, dynamic> _getAction() => {
        'load': _load,
        'flip': _flip,
        'shuffle': _shuffle,
        'use': _use,
      };

  @override
  void initState() {
    super.initState();
    for (int col = 0; col < widget._board.length; col++) {
      List<dynamic> _column = [];
      for (int row = 0; row < widget._board[col].length; row++) {
        _column.add([]);
        final String _name = widget._board[col][row]['field']['event'] != null
            ? widget._board[col][row]['field']['event']
            : 'none';
        if (_event.containsKey(_name)) _event[_name] = {'col': col, 'row': row};
      }
      print(_event);
      _card.add(_column);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 36.0, horizontal: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (int col = 0; col < widget._board.length; col++)
            Row(children: [
              for (int row = 0; row < widget._board[col].length; row++)
                _field(col, row)
            ]),
        ],
      ),
    );
  }

  Widget _field(int col, int row) {
    final Map<String, dynamic> _field = widget._board[col][row];

    return Expanded(
      child: Stack(
        children: [
          DragTarget(
            onAccept: (dynamic card) =>
                _drop(col, row, card['card'], card['show']),
            builder: (context, candidateData, rejectedData) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: RotatedBox(
                quarterTurns: _field['field']['type'],
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
          if (_card[col][row].isNotEmpty)
            for (var card in _card[col][row])
              Draggable(
                  child: DragTarget(
                      onAccept: (dynamic card) =>
                          _drop(col, row, card['card'], card['show']),
                      builder: (context, candidateData, rejectedData) => CARD(
                            card: card['card'],
                            save: false,
                            show: card['show'],
                            info: card['show'],
                          )),
                  data: card,
                  feedback: Container(
                    height: _size * 1.2,
                    child: CARD(
                      card: card['card'],
                      save: false,
                      show: card['show'],
                      info: card['show'],
                    ),
                  ),
                  childWhenDragging: Container(),
                  onDraggableCanceled: (velocity, offset) {
                    _drop(col, row, card['card'], false);
                  },
                  onDragEnd: (dragDetails) {
                    _drag(col, row);
                  }),
          action(
            col: col,
            row: row,
            option: _getAction(),
            onTap: _field['action'],
          ),
        ],
      ),
    );
  }
}
