import 'package:flutter/material.dart';
import 'package:project/api/model/cfv.dart';
import 'theme.dart';

class actioN extends StatefulWidget {
  final CardData card;
  final Function() onAdd;
  final Function() onRemove;

  const actioN({
    required this.card,
    required this.onAdd,
    required this.onRemove,
  });

  @override
  _actioNState createState() => _actioNState();
}

class _actioNState extends State<actioN> {
  late int cardCount;

  @override
  void initState() {
    super.initState();
    cardCount = widget.card.getCount();
  }

  void _updateCardCount() {
    setState(() {
      cardCount = widget.card.getCount();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0.0,
      right: 0.0,
      child: Column(
        children: [
          _Action(
            onPressed: () {
              if (cardCount > 0) {
                widget.onRemove();
                _updateCardCount();
              }
            },
            item: Icons.remove_rounded,
          ),
          _Action(
            onPressed: () {
              widget.onAdd();
              _updateCardCount();
            },
            item: Icons.add_rounded,
          ),
          _Action(
            onPressed: null,
            item: cardCount,
          ),
        ],
      ),
    );
  }

  Widget _Action({Function()? onPressed, dynamic item}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          width: 22.0,
          decoration: BoxDecoration(
            color: themE().primaryColorLight,
            shape: BoxShape.circle,
          ),
          child: item is int
              ? Text(
                  item.toString(),
                  style: themE().textTheme.bodyMedium?.copyWith(
                        color: themE().primaryColorDark,
                        fontWeight: FontWeight.bold,
                      ),
                  textAlign: TextAlign.center,
                )
              : Icon(
                  item,
                  color: themE().primaryColorDark,
                  size: 22.0,
                ),
        ),
      ),
    );
  }
}
