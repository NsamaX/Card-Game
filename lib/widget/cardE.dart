import 'package:flutter/material.dart';
import 'package:project/api/model/cfv.dart';
import 'package:project/api/service/deck.dart';
import 'card.dart';
import 'edit.dart';

class cardE extends StatelessWidget {
  final carDdatA _card;
  final bool _build;
  final bool _edit;

  const cardE({
    Key? key,
    required carDdatA card,
    required bool build,
    required bool edit,
  })  : _card = card,
        _build = build,
        _edit = edit,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final decK _d = decK();

    return Stack(
      children: [
        carD(card: _card, build: _build),
        if (_edit)
          ediT(
            card: _card,
            action: {
              Icons.add_rounded: () {
                _card.add();
                _d.update(
                  _card,
                  _card.getCount(),
                );
              },
              Icons.remove_rounded: () {
                if (_card.getCount() > 0) {
                  _card.remove();
                  _d.update(
                    _card,
                    _card.getCount(),
                  );
                }
              },
            },
          ),
      ],
    );
  }
}
