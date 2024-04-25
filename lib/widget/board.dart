import 'package:flutter/material.dart';
import 'action.dart';
import 'theme.dart';

class boarD extends StatelessWidget {
  final List<dynamic> _board;

  const boarD({Key? key, required List<dynamic> board})
      : _board = board,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 36.0, horizontal: 10.0),
      child: ListView.builder(
        itemCount: _board.length,
        itemBuilder: (context, index) {
          Map<dynamic, dynamic> data = _board[index];
          return Column(
            children: [
              for (var map in data.values)
                Row(children: [for (var board in map.values) _boarD(board)]),
            ],
          );
        },
      ),
    );
  }

  Widget _boarD(Map<String, dynamic> data) {
    String _name = data['field']['name'];

    return Expanded(
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 80.0,
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
          ),
          actioN(data: data),
        ],
      ),
    );
  }
}
