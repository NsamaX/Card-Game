import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/cfv.dart';

class decK {
  Future<bool> check(String cardName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? savedCards = prefs.getStringList('user_deck');
    if (savedCards != null) {
      String lowerCaseCardName = cardName.toLowerCase();
      for (String card in savedCards) {
        Map<String, dynamic> cardMap = jsonDecode(card);
        CardData cardData = CardData.fromJson(cardMap['model']);
        String lowerCaseExistingCardName = cardData.getName().toLowerCase();
        if (lowerCaseExistingCardName == lowerCaseCardName) {
          return true;
        }
      }
    }
    return false;
  }

  Future<void> save(CardData model, int cardCount) async {
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

  Future<void> update(CardData model, int newCardCount) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? savedCards = prefs.getStringList('user_deck');
    if (savedCards != null) {
      bool found = false;
      for (int i = 0; i < savedCards.length; i++) {
        Map<String, dynamic> cardMap = jsonDecode(savedCards[i]);
        CardData cardData = CardData.fromJson(cardMap['model']);
        if (cardData.getId() == model.getId()) {
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
        save(model, newCardCount);
      }
    }
  }

  Future<List<CardData>> load() async {
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
      deck.sort((a, b) => b.getGrade().compareTo(a.getGrade()));
    }
    return deck;
  }

  Future<void> delete() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('user_deck');
  }
}
