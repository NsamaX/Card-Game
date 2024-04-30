import 'package:flutter/material.dart';
import 'package:project/api/model.dart';
import 'package:project/service/deck.dart';
import 'card.dart';
import 'editCard.dart';

class cardList extends StatefulWidget {
  final ScrollController _scrollController;
  final List<model> _card;
  final bool _save;
  final bool _edit;

  cardList({
    Key? key,
    required ScrollController scrollController,
    required List<model> card,
    bool? save,
    bool? edit,
  })  : _scrollController = scrollController,
        _card = card,
        _save = save ?? false,
        _edit = edit ?? false,
        super(key: key);

  @override
  State<cardList> createState() => _cardListState();
}

class _cardListState extends State<cardList> {
  final deck _service = deck();
  final int _row = 3;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: widget._scrollController,
      itemCount: (widget._card.length / _row).ceil(),
      itemBuilder: (context, index) {
        return Row(
          children: [
            for (int i = 0; i < _row; i++)
              Expanded(
                child: index * _row + i < widget._card.length
                    ? _card(index * _row + i)
                    : SizedBox(),
              ),
          ],
        );
      },
    );
  }

  Widget _card(int index) {
    final _card = widget._card[index];

    return Stack(
      children: [
        CARD(card: _card, save: widget._save),
        if (widget._edit)
          editCard(
            card: _card,
            onTap: {
              Icons.add_rounded: () {
                _card.addCard();
                _service.update(
                  _card,
                  _card.getCount(),
                );
              },
              Icons.remove_rounded: () {
                if (_card.getCount() > 0) {
                  _card.removeCard();
                  _service.update(
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
