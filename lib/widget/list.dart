import 'package:flutter/material.dart';
import 'package:project/api/model.dart';
import 'package:project/service/deck.dart';
import 'card.dart';
import 'edit.dart';

class list extends StatefulWidget {
  final ScrollController _scrollController;
  final List<model> _card;
  final bool _build;
  final bool _edit;

  list({
    Key? key,
    required ScrollController scrollController,
    required List<model> card,
    bool? build,
    bool? edit,
  })  : _scrollController = scrollController,
        _card = card,
        _build = build ?? false,
        _edit = edit ?? false,
        super(key: key);

  @override
  State<list> createState() => _listState();
}

class _listState extends State<list> {
  @override
  Widget build(BuildContext context) {
    final int _row = 3;

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
    final deck _service = deck();

    return Stack(
      children: [
        CARD(card: _card, build: widget._build),
        if (widget._edit)
          edit(
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
