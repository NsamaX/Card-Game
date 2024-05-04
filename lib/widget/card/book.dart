import 'package:flutter/material.dart';
import 'package:project/api/model/cfv.dart';
import 'package:project/service/deck.dart';
import 'package:project/widget/card/card.dart';
import 'package:project/widget/card/edit.dart';

class Book extends StatelessWidget {
  final int cardInEachRow = 3;

  final ScrollController scrollController;
  final List<Model> cardList;
  final bool saveEnable;
  final bool editEnable;

  Book(
      {Key? key,
      required this.scrollController,
      required this.cardList,
      bool? saveEnable,
      bool? editEnable})
      : saveEnable = saveEnable ?? false,
        editEnable = editEnable ?? false,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView.builder(
        controller: scrollController,
        itemCount: (cardList.length / cardInEachRow).ceil(),
        itemBuilder: (context, index) {
          return Row(
            children: [
              for (int i = 0; i < cardInEachRow; i++)
                Expanded(
                  child: index * cardInEachRow + i < cardList.length
                      ? card(index * cardInEachRow + i)
                      : SizedBox(),
                ),
            ],
          );
        },
      ),
    );
  }

  Widget card(int index) {
    final card = cardList[index];

    return Stack(
      children: [
        CARD(card: card, saveEnable: saveEnable),
        if (editEnable)
          Edit(
            card: card,
            onTap: {
              Icons.add_rounded: () {
                card.addCard();
                DeckService().update(card, card.getCount());
              },
              Icons.remove_rounded: () {
                if (card.getCount() > 0) {
                  card.removeCard();
                  DeckService().update(card, card.getCount());
                }
              },
            },
          ),
      ],
    );
  }
}
