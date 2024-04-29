import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:project/api/model.dart';

class decK {
  Future<bool> check(String cardName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? savedCards = prefs.getStringList('user_deck');
    if (savedCards != null) {
      String lowerCaseCardName = cardName.toLowerCase();
      for (String card in savedCards) {
        Map<String, dynamic> cardMap = jsonDecode(card);
        model data = model.fromJson(cardMap['model']);
        String lowerCaseExistingCardName = data.getName().toLowerCase();
        if (lowerCaseExistingCardName == lowerCaseCardName) {
          return true;
        }
      }
    }
    return false;
  }

  Future<void> save(model model, int cardCount) async {
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

  Future<void> update(model newCard, int newCardCount) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? savedCards = prefs.getStringList('user_deck');
    if (savedCards != null) {
      bool found = false;
      for (int i = 0; i < savedCards.length; i++) {
        Map<String, dynamic> cardMap = jsonDecode(savedCards[i]);
        model data = model.fromJson(cardMap['model']);
        if (data.getName() == newCard.getName()) {
          found = true;
          data.setCount(newCardCount);
          cardMap['model'] = data.toJson();
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
        save(newCard, newCardCount);
      }
    }
  }

  Future<List<model>> load() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? savedCards = prefs.getStringList('user_deck');
    List<model> deck = [];
    if (savedCards != null) {
      for (String card in savedCards) {
        Map<String, dynamic> cardMap = jsonDecode(card);
        model data = model.fromJson(cardMap['model']);
        int cardCount = cardMap['cardCount'];
        data.setCount(cardCount);
        deck.add(data);
      }
      // deck.sort((a, b) => b.getGrade().compareTo(a.getGrade()));
    }
    return deck;
  }

  Future<void> delete() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('user_deck');
  }
}
