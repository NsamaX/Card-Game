import 'package:flutter/material.dart';
import 'package:project/api/model/cfv.dart';
import 'theme.dart';

class ediT extends StatefulWidget {
  final CardData _card;
  final Map<IconData, Function()> _action;

  const ediT({
    Key? key,
    required CardData card,
    required Map<IconData, Function()> action,
  })  : _card = card,
        _action = action,
        super(key: key);

  @override
  _ediTState createState() => _ediTState();
}

class _ediTState extends State<ediT> {
  late int _cardCount;

  @override
  void initState() {
    super.initState();
    _cardCount = widget._card.getCount();
  }

  void _updateCardCount() {
    setState(() {
      _cardCount = widget._card.getCount();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0.0,
      right: 0.0,
      child: Column(
        children: [
          for (dynamic item in widget._action.keys)
            _action(
                item: item,
                onPressed: () {
                  widget._action[item]!();
                  _updateCardCount();
                }),
          _action(item: _cardCount, onPressed: null),
        ],
      ),
    );
  }

  Widget _action({required dynamic item, required Function()? onPressed}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          width: 22.0,
          decoration: BoxDecoration(
            color: themE().iconTheme.color,
            shape: BoxShape.circle,
          ),
          child: item is int
              ? Text(
                  item.toString(),
                  style: themE().textTheme.bodyMedium?.copyWith(
                        color: themE().primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                  textAlign: TextAlign.center,
                )
              : Icon(
                  item,
                  color: themE().primaryColor,
                  size: 22.0,
                ),
        ),
      ),
    );
  }
}
