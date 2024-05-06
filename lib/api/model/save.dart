abstract class Save {
  String sleeve =
      'https://64.media.tumblr.com/c75b12d2a73af3c9f87164f46a5795ea/ffa4a60c77f7c05f-a7/s400x600/5a97565db15b46d9c9156e23820614e7a23f4733.jpg';
  int count = 1;

  void setSleeve({required String sleeve}) => this.sleeve = sleeve;
  void setCount({required int count}) => this.count = count;
  void addCard() => count++;
  void removeCard() => count--;

  String getSleeve() => sleeve;
  int getCount() => count;
}
