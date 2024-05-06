import 'package:flutter/material.dart';
import 'package:project/api/model/model.dart';
import 'package:project/api/service/deck.dart';
import 'package:project/widget/card/card.dart';
import 'package:project/widget/card/edit.dart';

class _BookState extends State<Book> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView.builder(
        controller: widget.scrollController,
        itemCount: (widget.cardList.length / cardInEachRow).ceil(),
        itemBuilder: (context, index) {
          return Row(
            children: [
              for (int i = 0; i < cardInEachRow; i++)
                Expanded(
                  child: index * cardInEachRow + i < widget.cardList.length
                      ? card(index: index * cardInEachRow + i)
                      : SizedBox(),
                ),
            ],
          );
        },
      ),
    );
  }

  Widget card({required int index}) {
    final card = widget.cardList[index];

    return Stack(
      children: [
        CARD(card: card, saveEnable: widget.saveEnable),
        if (widget.editEnable)
          Edit(
            card: card,
            onTap: {
              Icons.add_rounded: () {
                card.addCard();
                DeckService().update(
                    game: widget.game, card: card, cardCount: card.getCount());
              },
              Icons.remove_rounded: () {
                if (card.getCount() > 0) {
                  card.removeCard();
                  DeckService().update(
                      game: widget.game,
                      card: card,
                      cardCount: card.getCount());
                }
              },
            },
          ),
      ],
    );
  }

  final int cardInEachRow = 3;
}

class Book extends StatefulWidget {
  final ScrollController scrollController;
  final String game;
  final List<Model> cardList;
  final bool saveEnable;
  final bool editEnable;

  const Book(
      {Key? key,
      required this.scrollController,
      required this.game,
      required this.cardList,
      bool? saveEnable,
      bool? editEnable})
      : saveEnable = saveEnable ?? false,
        editEnable = editEnable ?? false,
        super(key: key);

  @override
  State<Book> createState() => _BookState();
}
