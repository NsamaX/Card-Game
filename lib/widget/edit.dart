import 'package:flutter/material.dart';
import 'package:project/api/model.dart';
import 'theme.dart';

class edit extends StatefulWidget {
  final model _card;
  final Map<dynamic, Function()> _onTap;

  const edit({
    Key? key,
    required model card,
    required Map<dynamic, Function()> onTap,
  })  : _card = card,
        _onTap = onTap,
        super(key: key);

  @override
  _editState createState() => _editState();
}

class _editState extends State<edit> {
  late int _cardCount;

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
            _action(
                item: item,
                onPressed: () {
                  widget._onTap[item]!();
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
                  size: 22.0,
                ),
        ),
      ),
    );
  }
}
