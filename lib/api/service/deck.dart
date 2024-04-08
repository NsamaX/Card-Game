import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/cfv.dart';
import '../model/savedCard.dart';

Future<void> saveCard(CardData model, int cardCount) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String> savedCards = prefs.getStringList('user_deck') ?? [];

  Map<String, dynamic> cardMap = {
    'model': model.toJson(),
    'cardCount': cardCount,
  };

  savedCards.add(jsonEncode(cardMap));
  await prefs.setStringList('user_deck', savedCards);
}

Future<List<SaveCard>> loadDeck() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String>? savedCards = prefs.getStringList('user_deck');

  List<SaveCard> deck = [];

  if (savedCards != null) {
    for (String cardJson in savedCards) {
      Map<String, dynamic>? cardMap = jsonDecode(cardJson);

      if (cardMap != null && cardMap.containsKey('model')) {
        CardData model = CardData.fromJson(cardMap['model']);
        int cardCount = cardMap['cardCount'] ?? 0;
        deck.add(SaveCard(card: model, cardCount: cardCount));
      } else {
        print('Invalid or missing data for a card.');
      }
    }
  } else {
    print('No saved deck found.');
  }

  return deck;
}

Future<void> deleteDeck() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove('user_deck');
}
