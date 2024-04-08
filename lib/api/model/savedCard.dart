import 'cfv.dart';

class SaveCard {
  final CardData card;
  int cardCount;
  SaveCard({required this.card, required this.cardCount});

  int getCardCount() {
    return cardCount;
  }

  void setCardCount(int cardCount) {
    this.cardCount = cardCount;
  }
}
