import 'package:flutter/material.dart';

class _MoveSetState extends State<MoveSet> {
  @override
  Widget build(BuildContext context) {
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
                    // hide this condition if you want to show all moves
                    if (action['show'])
                      move(option: widget.option, move: action),
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
      {required Map<String, dynamic> option,
      required Map<String, dynamic> move}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: GestureDetector(
        onTap: () {
          switch (move['action']) {
            case 'draw':
              return option['draw'](widget.col, widget.row);
            case 'flip':
              return option['flip'](widget.col, widget.row);
            case 'load':
              return option['load'](widget.col, widget.row);
            case 'shuffle':
              return option['shuffle'](20, widget.col, widget.row);
            case 'special':
            case 'tigger':
            case 'guard':
            case 'show':
            case 'bind':
            case 'damage':
            case 'drop':
              return option['use'](widget.col, widget.row, move['action']);
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

  late final List<dynamic> moveSet = widget.field['action'];

  late final ThemeData theme = Theme.of(context);
}

class MoveSet extends StatefulWidget {
  final int col;
  final int row;
  final Map<String, dynamic> field;
  final Map<String, dynamic> option;

  const MoveSet(
      {Key? key,
      required this.col,
      required this.row,
      required this.field,
      required this.option})
      : super(key: key);

  @override
  State<MoveSet> createState() => _MoveSetState();
}
