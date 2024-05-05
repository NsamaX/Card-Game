import 'package:flutter/material.dart';
import 'package:project/api/model/cfv.dart';

class _EditState extends State<Edit> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      right: 0,
      child: Column(
        children: [
          for (var item in widget.onTap.keys)
            option(item, () {
              widget.onTap[item]!();
              updateCardCount();
            }),
          option(cardCount, null),
        ],
      ),
    );
  }

  Widget option(dynamic item, Function? onPressed) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: GestureDetector(
        onTap: () {
          onPressed!();
        },
        child: Container(
          width: optionSize,
          decoration: BoxDecoration(
            color: theme.iconTheme.color,
            shape: BoxShape.circle,
          ),
          child: item is int
              ? Text(item.toString(),
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center)
              : Icon(item, color: theme.primaryColor, size: optionSize * 0.9),
        ),
      ),
    );
  }

  void updateCardCount() {
    setState(() {
      cardCount = widget.card.getCount();
    });
  }

  @override
  void initState() {
    super.initState();
    cardCount = widget.card.getCount();
  }

  late int cardCount;

  final double optionSize = 26;

  late final ThemeData theme = Theme.of(context);
}

class Edit extends StatefulWidget {
  final Model card;
  final Map<dynamic, Function()> onTap;

  const Edit({Key? key, required this.card, required this.onTap})
      : super(key: key);

  @override
  _EditState createState() => _EditState();
}
