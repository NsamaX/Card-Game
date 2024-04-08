import 'package:flutter/material.dart';
import 'package:project/api/model/cfv.dart';
import 'card.dart';

class CardList extends StatefulWidget {
  final List<CardData> cardDataList;
  final ScrollController? scrollController;
  final bool buildDeck;

  const CardList({
    Key? key,
    required this.cardDataList,
    this.scrollController,
    required this.buildDeck,
  }) : super(key: key);

  @override
  State<CardList> createState() => _CardListState();
}

class _CardListState extends State<CardList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: widget.scrollController,
      itemCount: (widget.cardDataList.length / 2).ceil(),
      itemBuilder: (context, index) {
        return Row(
          children: [
            Expanded(
              child: CardWidget.buildCard(
                widget.cardDataList[index * 2].getImage(),
                index * 2,
                widget.cardDataList,
                context,
                widget.buildDeck,
              ),
            ),
            Expanded(
              child: (index * 2 + 1 < widget.cardDataList.length)
                  ? CardWidget.buildCard(
                      widget.cardDataList[index * 2 + 1].getImage(),
                      index * 2 + 1,
                      widget.cardDataList,
                      context,
                      widget.buildDeck,
                    )
                  : SizedBox(),
            ),
          ],
        );
      },
    );
  }
}
