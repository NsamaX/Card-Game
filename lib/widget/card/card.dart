import 'package:flutter/material.dart';
import 'package:project/api/model/cfv.dart';
import 'single/info.dart';

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
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(14.0),
                child: Image.network(
                  image,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey,
                      child: Center(
                        child: Icon(Icons.error),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
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
