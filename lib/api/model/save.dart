abstract class Save {
  int _count = 1;

  int getCount() {
    return _count;
  }

  void setCount(int count) {
    this._count = count;
  }

  void addCard() {
    _count++;
  }

  void removeCard() {
    _count--;
  }
}
