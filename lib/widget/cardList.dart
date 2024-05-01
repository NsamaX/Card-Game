import 'package:flutter/material.dart';
import 'package:project/api/model.dart';
import 'package:project/service/deck.dart';
import 'card.dart';
import 'cardEdit.dart';

class CardList extends StatelessWidget {
  final int cardInEachRow = 3;

  final ScrollController _scrollController;
  final List<Model> _cards;
  final bool _save;
  final bool _edit;

  CardList(
      {Key? key,
      required ScrollController scrollController,
      required List<Model> card,
      bool? save,
      bool? edit})
      : _scrollController = scrollController,
        _cards = card,
        _save = save ?? false,
        _edit = edit ?? false,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
      itemCount: (_cards.length / cardInEachRow).ceil(),
      itemBuilder: (context, index) {
        return Row(
          children: [
            for (int i = 0; i < cardInEachRow; i++)
              Expanded(
                child: index * cardInEachRow + i < _cards.length
                    ? _card(index * cardInEachRow + i)
                    : SizedBox(),
              ),
          ],
        );
      },
    );
  }

  Widget _card(int index) {
    final _card = _cards[index];

    return Stack(
      children: [
        CARD(card: _card, save: _save),
        if (_edit)
          CardEdit(
            card: _card,
            onTap: {
              Icons.add_rounded: () {
                _card.addCard();
                Deck().update(_card, _card.getCount());
              },
              Icons.remove_rounded: () {
                if (_card.getCount() > 0) {
                  _card.removeCard();
                  Deck().update(_card, _card.getCount());
                }
              },
            },
          ),
      ],
    );
  }
}
