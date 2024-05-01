import 'package:flutter/material.dart';
import 'package:project/api/model.dart';

class EditCard extends StatefulWidget {
  final model _card;
  final Map<dynamic, Function()> _onTap;

  const EditCard({
    Key? key,
    required model card,
    required Map<dynamic, Function()> onTap,
  })  : _card = card,
        _onTap = onTap,
        super(key: key);

  @override
  _EditCardState createState() => _EditCardState();
}

class _EditCardState extends State<EditCard> {
  final double _optionSize = 26.0;

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
    final ThemeData _theme = Theme.of(context);

    return Positioned(
      top: 0.0,
      right: 0.0,
      child: Column(
        children: [
          for (var item in widget._onTap.keys)
            _option(
                theme: _theme,
                item: item,
                onPressed: () {
                  widget._onTap[item]!();
                  _updateCardCount();
                }),
          _option(theme: _theme, item: _cardCount, onPressed: null),
        ],
      ),
    );
  }

  Widget _option(
      {required ThemeData theme,
      required dynamic item,
      required Function()? onPressed}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          width: _optionSize,
          decoration: BoxDecoration(
            color: theme.iconTheme.color,
            shape: BoxShape.circle,
          ),
          child: item is int
              ? Text(
                  item.toString(),
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                )
              : Icon(
                  item,
                  color: theme.primaryColor,
                  size: _optionSize * 0.9,
                ),
        ),
      ),
    );
  }
}
