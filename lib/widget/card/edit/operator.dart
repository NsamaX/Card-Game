import 'package:flutter/material.dart';
import 'package:project/api/model/cfv.dart';
import 'item.dart';
import 'option.dart';

class CardOperator extends StatefulWidget {
  final CardData card;
  final Function() onAdd;
  final Function() onRemove;

  const CardOperator({
    required this.card,
    required this.onAdd,
    required this.onRemove,
  });

  @override
  _CardOperatorState createState() => _CardOperatorState();
}

class _CardOperatorState extends State<CardOperator> {
  late int cardCount;

  @override
  void initState() {
    super.initState();
    cardCount = widget.card.getCount();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0.0,
      right: 0.0,
      child: Column(
        children: [
          Item(
            icon: Icons.remove_rounded,
            onPressed: () {
              (cardCount > 0)
                  ? {
                      widget.onRemove(),
                      _updateCardCount(),
                    }
                  : null;
            },
          ),
          SizedBox(height: 12.0),
          Item(
            icon: Icons.add_rounded,
            onPressed: () {
              widget.onAdd();
              _updateCardCount();
            },
          ),
          SizedBox(height: 12.0),
          Option(count: cardCount),
        ],
      ),
    );
  }

  void _updateCardCount() {
    setState(() {
      cardCount = widget.card.getCount();
    });
  }
}
