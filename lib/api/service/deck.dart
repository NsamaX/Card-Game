import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/cfv.dart';

Future<void> saveCard(CardData model, int cardCount) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String> savedCards = prefs.getStringList('user_deck') ?? [];

  Map<String, dynamic> cardMap = {
    'model': model.toJson(),
    'cardCount': cardCount,
  };

  String cardJson = jsonEncode(cardMap);
  print('JSON representation of the card: $cardJson');

  savedCards.add(cardJson);
  await prefs.setStringList('user_deck', savedCards);
}

Future<List<CardData>> loadDeck() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String>? savedCards = prefs.getStringList('user_deck');

  List<CardData> deck = [];

  if (savedCards != null) {
    for (String card in savedCards) {
      Map<String, dynamic> cardMap = jsonDecode(card);
      CardData cardData = CardData.fromJson(cardMap['model']);

      int cardCount = cardMap['cardCount'];
      cardData.setCardCount(cardCount);

      deck.add(cardData);
    }
  }

  return deck;
}

Future<void> deleteDeck() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove('user_deck');
}
