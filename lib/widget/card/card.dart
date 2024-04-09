import 'package:flutter/material.dart';
import 'package:project/api/model/cfv.dart';
import 'package:project/api/service/deck.dart';
import 'package:project/page/card/contents.dart';
import 'operator.dart';

class CardWidget extends StatelessWidget {
  final List<CardData> cardDataList;
  final int index;
  final BuildContext context;
  final bool buildDeck;
  final bool editDeck;
  final Function(int)? removeCardCallBack;

  const CardWidget({
    Key? key,
    required this.cardDataList,
    required this.index,
    required this.context,
    required this.buildDeck,
    required this.editDeck,
    this.removeCardCallBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CardData card = cardDataList[index];
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            _navigateToCardInfo(card, context, save: buildDeck);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(14.0),
                    child: AspectRatio(
                      aspectRatio: 8 / 12,
                      child: Image.network(
                        card.getImage(),
                        fit: BoxFit.cover,
                        loadingBuilder: (BuildContext context, Widget child,
                            ImageChunkEvent? loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          }
                          return Container(
                            child: Center(
                              child: CircularProgressIndicator(
                                value: loadingProgress.expectedTotalBytes !=
                                        null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes!
                                    : null,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
        if (editDeck)
          CardOperator(
            card: card,
            onAdd: () {
              card.addCard();
              _updateCardCount(card);
            },
            onRemove: () {
              card.removeCard();
              _updateCardCount(card);
              if (removeCardCallBack != null) {
                removeCardCallBack!(index);
              }
            },
          ),
      ],
    );
  }

  void _navigateToCardInfo(
    CardData cardData,
    BuildContext context, {
    required bool save,
  }) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => CardInfoPage(
          model: cardData,
          save: save,
        ),
      ),
    );
  }

  void _updateCardCount(CardData card) {
    updateDeck(
      card,
      card.getCardCount(),
    );
  }
}
