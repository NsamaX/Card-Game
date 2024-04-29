import 'package:flutter/material.dart';
import 'package:project/api/model.dart';
import 'cardE.dart';

class lisT extends StatefulWidget {
  final ScrollController _scrollController;
  final List<model> _card;
  final bool _build;
  final bool _edit;

  const lisT({
    Key? key,
    required ScrollController scrollController,
    required List<model> card,
    required bool build,
    required bool edit,
  })  : _scrollController = scrollController,
        _card = card,
        _build = build,
        _edit = edit,
        super(key: key);

  @override
  State<lisT> createState() => _lisTState();
}

class _lisTState extends State<lisT> {
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
              Expanded(child: _card(index * _row + i)),
          ],
        );
      },
    );
  }

  Widget _card(int index) {
    return (index < widget._card.length)
        ? cardE(
            card: widget._card[index],
            build: widget._build,
            edit: widget._edit,
          )
        : SizedBox();
  }
}
