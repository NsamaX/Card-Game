abstract class Save {
  String _sleeve =
      'https://64.media.tumblr.com/c75b12d2a73af3c9f87164f46a5795ea/ffa4a60c77f7c05f-a7/s400x600/5a97565db15b46d9c9156e23820614e7a23f4733.jpg';
  int _count = 1;

  void setSleeve(String sleeve) => this._sleeve = sleeve;
  void setCount(int count) => this._count = count;
  void addCard() => _count++;
  void removeCard() => _count--;

  String getSleeve() => _sleeve;
  int getCount() => _count;
}
