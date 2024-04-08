import 'package:flutter/material.dart';
import 'package:project/api/model/cfv.dart';
import 'package:project/page/card/info.dart';

class CardWidget {
  static Widget buildCard(
    String image,
    int cardIndex,
    List<CardData> cardDataList,
    BuildContext context,
    bool buildDeck,
  ) {
    return GestureDetector(
      onTap: () {
        _navigateToCardInfo(cardDataList[cardIndex], context, save: buildDeck);
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
                    image,
                    fit: BoxFit.cover,
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      }
                      return Container(
                        child: Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
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
    );
  }

  static void _navigateToCardInfo(
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
}
