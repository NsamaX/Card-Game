import 'package:flutter/material.dart';
import 'package:project/api/model/cfv.dart';
import 'package:project/api/service/deck.dart';
import 'package:project/page/card/contents.dart';
import 'card.dart';
import 'edit.dart';

class cardE extends StatelessWidget {
  final CardData _card;
  final bool _build;
  final bool _edit;

  const cardE({
    Key? key,
    required CardData card,
    required bool build,
    required bool edit,
  })  : _card = card,
        _build = build,
        _edit = edit,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => CardInfoPage(
                  model: _card,
                  save: _build,
                ),
              ),
            );
          },
          child: carD(card: _card),
        ),
        if (_edit)
          ediT(
            card: _card,
            onAdd: () {
              _card.addCard();
              updateDeck(_card, _card.getCount());
            },
            onRemove: () {
              _card.removeCard();
              updateDeck(_card, _card.getCount());
            },
          ),
      ],
    );
  }
}
