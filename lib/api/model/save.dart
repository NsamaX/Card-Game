abstract class Save {
  int count = 1;

  int getCount() {
    return count;
  }

  void setCount(int count) {
    this.count = count;
  }

  void addCard() {
    count++;
  }

  void removeCard() {
    count--;
  }
}
