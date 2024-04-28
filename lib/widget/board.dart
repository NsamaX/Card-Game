import 'package:flutter/material.dart';
import 'package:project/api/model/cfv.dart';
import 'package:project/api/service/deck.dart';
import 'action.dart';
import 'card.dart';
import 'theme.dart';

class boarD extends StatefulWidget {
  final List<dynamic> _board;

  const boarD({Key? key, required List<dynamic> board})
      : _board = board,
        super(key: key);

  @override
  State<boarD> createState() => _boarDState();
}

class _boarDState extends State<boarD> {
  final decK _d = decK();
  late List<carDdatA> _deck;
  late List<dynamic> _card = [];

  void _load(int col, int row) {
    _d.load().then(
      (deck) {
        setState(() {
          _deck = deck;
          _card[col][row].addAll(_deck);
        });
      },
    );
    print('deck loaded');
  }

  @override
  void initState() {
    super.initState();
    for (int col = 0; col < widget._board.length; col++) {
      _card.add([]);
      for (int row = 0; row < widget._board[col].length; row++)
        _card[col].add([]);
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
    final Map<String, dynamic> data = widget._board[col][row];
    final String _name = data['field']['name'];
    final List<dynamic> _action = data['action'];
    final _size = 80.0;

    return Expanded(
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RotatedBox(
              quarterTurns: data['field']['type'] * 3,
              child: Stack(
                children: [
                  Container(
                    width: _size,
                    height: _size,
                    decoration: BoxDecoration(
                      color: themE().appBarTheme.backgroundColor,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Center(
                      child: Text(
                        _name,
                        style: themE().textTheme.bodySmall?.copyWith(
                            color: themE().iconTheme.color!.withOpacity(0.6)),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  if (_card[col][row] != null)
                    for (var card in _card[col][row])
                      carD(card: card, build: false)
                ],
              ),
            ),
          ),
          actioN(col: col, row: row, option: _load, onTap: _action),
        ],
      ),
    );
  }
}
