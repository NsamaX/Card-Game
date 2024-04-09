import 'package:flutter/material.dart';
import 'package:project/api/model/cfv.dart';
import 'card.dart';

class CardList extends StatefulWidget {
  final List<CardData> cardDataList;
  final ScrollController? scrollController;
  final bool buildDeck;
  final bool editDeck;
  final Function(int)? removeCardCallBack;

  const CardList({
    Key? key,
    required this.cardDataList,
    this.scrollController,
    required this.buildDeck,
    required this.editDeck,
    this.removeCardCallBack,
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
            for (int i = 0; i < 2; i++) buildCard(index * 2 + i),
          ],
        );
      },
    );
  }

  Widget buildCard(int index) {
    return Expanded(
        child: (index < widget.cardDataList.length)
            ? CardWidget(
                cardDataList: widget.cardDataList,
                index: index,
                context: context,
                buildDeck: widget.buildDeck,
                editDeck: widget.editDeck,
                removeCardCallBack: widget.removeCardCallBack,
              )
            : SizedBox());
  }
}
