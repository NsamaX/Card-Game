import 'package:flutter/material.dart';

class MoveSet extends StatelessWidget {
  final int col;
  final int row;
  final Map<String, dynamic> option;
  final List<dynamic> moveSet;

  const MoveSet(
      {Key? key,
      required this.col,
      required this.row,
      required this.option,
      required this.moveSet})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    if (moveSet.isNotEmpty)
      return Positioned(
        top: 0,
        right: 0,
        child: Container(
          width: theme.iconTheme.size,
          height: 86,
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Column(
                children: [
                  for (var action in moveSet)
                    // hide this line if you want to show all moves
                    if (action['show']) move(theme, option, action),
                ],
              ),
            ],
          ),
        ),
      );
    else
      return const SizedBox();
  }

  Widget move(
      ThemeData theme, Map<String, dynamic> option, Map<String, dynamic> move) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: GestureDetector(
        onTap: () {
          switch (move['action']) {
            case 'draw':
              return option['draw'](col, row);
            case 'flip':
              return option['flip'](col, row);
            case 'load':
              return option['load'](col, row);
            case 'shuffle':
              return option['shuffle'](20, col, row);
            case 'special':
            case 'tigger':
            case 'guard':
            case 'show':
            case 'bind':
            case 'damage':
            case 'drop':
              return option['use'](col, row, move['action']);
            default:
              break;
          }
        },
        child: move['icon'] is String
            ? Text(move['icon'], style: theme.textTheme.bodySmall)
            : Icon(move['icon']),
      ),
    );
  }
}
