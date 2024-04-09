import 'package:flutter/material.dart';
import 'package:project/api/model/cfv.dart';

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
    cardCount = widget.card.getCardCount();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0.0,
      right: 0.0,
      child: Column(
        children: [
          _buildIconButton(Icons.remove_rounded, () {
            widget.onRemove();
            _updateCardCount();
          }),
          SizedBox(height: 12.0),
          _buildIconButton(Icons.add_rounded, () {
            widget.onAdd();
            _updateCardCount();
          }),
          SizedBox(height: 12.0),
          _buildCountContainer(cardCount),
        ],
      ),
    );
  }

  Widget _buildIconButton(IconData icon, Function() onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 36.0,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: Colors.black,
          size: 26.0,
        ),
      ),
    );
  }

  Widget _buildCountContainer(int count) {
    return Container(
      width: 26.0,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: Text(
        count.toString(),
        style: TextStyle(
          color: Colors.black,
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  void _updateCardCount() {
    setState(() {
      cardCount = widget.card.getCardCount();
    });
  }
}
