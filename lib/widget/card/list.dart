import 'package:flutter/material.dart';
import 'package:project/api/model/cfv.dart';
import 'card.dart';

class CardList extends StatefulWidget {
  final ScrollController? scrollController;
  final List<CardData> cardList;
  final bool buildDeck;
  final bool editDeck;

  const CardList({
    Key? key,
    this.scrollController,
    required this.cardList,
    required this.buildDeck,
    required this.editDeck,
  }) : super(key: key);

  @override
  State<CardList> createState() => _CardListState();
}

class _CardListState extends State<CardList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: widget.scrollController,
      itemCount: (widget.cardList.length / 2).ceil(),
      itemBuilder: (context, index) {
        return Row(
          children: [
            for (int i = 0; i < 2; i++)
              Expanded(child: card(index * 2 + i)),
          ],
        );
      },
    );
  }

  Widget card(int index) {
    return (index < widget.cardList.length)
        ? CardWidget(
            card: widget.cardList[index],
            context: context,
            buildDeck: widget.buildDeck,
            editDeck: widget.editDeck,
          )
        : SizedBox();
  }
}
