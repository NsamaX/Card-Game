import 'package:flutter/material.dart';
import 'package:project/api/model/cfv.dart';
import 'package:project/api/service/deck.dart';
import 'package:project/page/card/contents.dart';
import 'edit/operator.dart';

class CardWidget extends StatelessWidget {
  final CardData card;
  final bool _build;
  final bool _edit;

  const CardWidget({
    Key? key,
    required this.card,
    required bool build,
    required bool edit,
  })  : _build = build,
        _edit = edit,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            _navigateToCardInfo(card, context, save: _build);
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
        if (_edit)
          CardOperator(
            card: card,
            onAdd: () {
              card.addCard();
              _updateCardCount(card);
            },
            onRemove: () {
              card.removeCard();
              _updateCardCount(card);
            },
          ),
      ],
    );
  }

  void _navigateToCardInfo(
    CardData cardcard,
    BuildContext context, {
    required bool save,
  }) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => CardInfoPage(
          model: cardcard,
          save: save,
        ),
      ),
    );
  }

  void _updateCardCount(CardData card) {
    updateDeck(card, card.getCount());
  }
}
