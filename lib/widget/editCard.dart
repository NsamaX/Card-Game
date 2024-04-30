import 'package:flutter/material.dart';
import 'package:project/api/model.dart';
import 'theme.dart';

class editCard extends StatefulWidget {
  final model _card;
  final Map<dynamic, Function()> _onTap;

  const editCard({
    Key? key,
    required model card,
    required Map<dynamic, Function()> onTap,
  })  : _card = card,
        _onTap = onTap,
        super(key: key);

  @override
  _editCardState createState() => _editCardState();
}

class _editCardState extends State<editCard> {
  late int _cardCount;
  final double _size = 26.0;

  void _updateCardCount() {
    setState(() {
      _cardCount = widget._card.getCount();
    });
  }

  @override
  void initState() {
    super.initState();
    _cardCount = widget._card.getCount();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0.0,
      right: 0.0,
      child: Column(
        children: [
          for (var item in widget._onTap.keys)
            _option(
                item: item,
                onPressed: () {
                  widget._onTap[item]!();
                  _updateCardCount();
                }),
          _option(item: _cardCount, onPressed: null),
        ],
      ),
    );
  }

  Widget _option({required dynamic item, required Function()? onPressed}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          width: _size,
          decoration: BoxDecoration(
            color: themeData().iconTheme.color,
            shape: BoxShape.circle,
          ),
          child: item is int
              ? Text(
                  item.toString(),
                  style: themeData().textTheme.bodyMedium?.copyWith(
                        color: themeData().primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                  textAlign: TextAlign.center,
                )
              : Icon(
                  item,
                  color: themeData().primaryColor,
                  size: _size * 0.9,
                ),
        ),
      ),
    );
  }
}
