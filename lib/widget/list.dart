import 'package:flutter/material.dart';
import 'package:project/api/model/cfv.dart';
import 'card/card.dart';

class lisT extends StatefulWidget {
  final ScrollController _scrollController;
  final List<CardData> _card;
  final bool _build;
  final bool _edit;

  const lisT({
    Key? key,
    required ScrollController scrollController,
    required List<CardData> card,
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
    final int column = 3;

    return ListView.builder(
      controller: widget._scrollController,
      itemCount: (widget._card.length / 3).ceil(),
      itemBuilder: (context, index) {
        return Row(
          children: [
            for (int i = 0; i < column; i++)
              Expanded(child: buildCard(index * column + i)),
          ],
        );
      },
    );
  }

  Widget buildCard(int index) {
    return (index < widget._card.length)
        ? CardWidget(
            card: widget._card[index],
            build: widget._build,
            edit: widget._edit,
          )
        : SizedBox();
  }
}
