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
      cardData.setCount(cardCount);

      deck.add(cardData);
    }
    // deck.sort((a, b) => b.grade.compareTo(a.grade));
  }

  return deck;
}

Future<void> updateDeck(CardData model, int newCardCount) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String>? savedCards = prefs.getStringList('user_deck');

  if (savedCards != null) {
    bool found = false;
    for (int i = 0; i < savedCards.length; i++) {
      Map<String, dynamic> cardMap = jsonDecode(savedCards[i]);
      CardData cardData = CardData.fromJson(cardMap['model']);

      if (cardData.id == model.id) {
        found = true;
        cardData.setCount(newCardCount);
        cardMap['model'] = cardData.toJson();
        cardMap['cardCount'] = newCardCount;

        if (newCardCount < 1) {
          savedCards.removeAt(i);
        } else {
          String updatedCardJson = jsonEncode(cardMap);
          savedCards[i] = updatedCardJson;
        }

        await prefs.setStringList('user_deck', savedCards);
        return;
      }
    }
    if (!found) {
      saveCard(model, newCardCount);
    }
  }
}

Future<void> deleteDeck() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove('user_deck');
}
