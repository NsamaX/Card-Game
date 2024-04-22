import 'package:flutter/material.dart';
import 'package:project/api/model/cfv.dart';
import 'theme.dart';

class ediT extends StatefulWidget {
  final CardData card;
  final Function() onAdd;
  final Function() onRemove;

  const ediT({
    required this.card,
    required this.onAdd,
    required this.onRemove,
  });

  @override
  _ediTState createState() => _ediTState();
}

class _ediTState extends State<ediT> {
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
          _ediT(
            onPressed: () {
              if (cardCount > 0) {
                widget.onRemove();
                _updateCardCount();
              }
            },
            item: Icons.remove_rounded,
          ),
          _ediT(
            onPressed: () {
              widget.onAdd();
              _updateCardCount();
            },
            item: Icons.add_rounded,
          ),
          _ediT(
            onPressed: null,
            item: cardCount,
          ),
        ],
      ),
    );
  }

  Widget _ediT({Function()? onPressed, dynamic item}) {
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
