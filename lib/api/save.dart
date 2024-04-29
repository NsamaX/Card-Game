abstract class save {
  String _sleeve =
      'https://www.google.com/url?sa=i&url=https%3A%2F%2Fweb.credinca.com%2F%3Fu%3Dechidna-re-zero-rezero-witch-of-greed-hd-phone-uu-53jkEks0&psig=AOvVaw3yuL0t2S6mErL-JJQz6P0d&ust=1714463845632000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCJjb09755oUDFQAAAAAdAAAAABAJ';
  int _count = 1;

  void setSleeve(String sleeve) => this._sleeve = sleeve;
  void setCount(int count) => this._count = count;
  void addCard() => _count++;
  void removeCard() => _count--;

  String getSleeve() => _sleeve;
  int getCount() => _count;
}
