abstract class Save {
  int cardCount = 1;

  int getCardCount() {
    return cardCount;
  }

  void setCardCount(int cardCount) {
    this.cardCount = cardCount;
  }

  void addCard() {
    cardCount++;
  }

  void removeCard() {
    cardCount--;
  }
}
