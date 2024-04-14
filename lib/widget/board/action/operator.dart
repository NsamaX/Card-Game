import 'package:flutter/material.dart';
import 'package:project/api/model/cfv.dart';
import 'item.dart';
import 'option.dart';

class CardOperator extends StatefulWidget {
  final Function() flip;
  final Function() search;
  final Function() rest;

  const CardOperator({
    required this.flip,
    required this.search,
    required this.rest,
  });

  @override
  _CardOperatorState createState() => _CardOperatorState();
}

class _CardOperatorState extends State<CardOperator> {
  late int cardCount;

  @override
  void initState() {
    super.initState();
    // cardCount = widget.card.getCount();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0.0,
      right: 0.0,
      child: Column(
        children: [
          Item(
            icon: Icons.search,
            onPressed: () {
              (cardCount > 0)
                  ? {
                      widget.search(),
                      _updateCardCount(),
                    }
                  : null;
            },
          ),
          SizedBox(height: 6.0),
          Item(
            icon: Icons.cached_rounded,
            onPressed: () {
              widget.flip();
              _updateCardCount();
            },
          ),
          SizedBox(height: 6.0),
          // Option(count: cardCount),
          Item(
            icon: Icons.screen_rotation_rounded,
            onPressed: () {
              widget.flip();
              _updateCardCount();
            },
          ),
        ],
      ),
    );
  }

  void _updateCardCount() {
    setState(() {
      // cardCount = widget.card.getCount();
    });
  }
}
