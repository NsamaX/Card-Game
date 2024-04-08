import 'package:flutter/material.dart';
import 'package:project/api/model/savedCard.dart';
import 'package:project/api/service/deck.dart';
import 'package:project/page/card/page.dart';

List<dynamic> icons = [
  Icons.menu,
  Icons.ios_share_rounded,
  'My Deck',
  Icons.delete_rounded,
  Icons.add,
];

typedef void DeleteDeckCallback();

List<Function> getOnTapCallbacks(BuildContext context, List<SaveCard> myDeck,
    DeleteDeckCallback deleteDeckCallback) {
  return [
    () {},
    () {},
    () {},
    () {
      deleteDeck().then((_) {
        myDeck.clear();
        print('clear');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Deleted deck successfully'),
          ),
        );
        deleteDeckCallback();
      });
    },
    () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => CardsPage(page: 'deck', save: true),
        ),
      );
    },
  ];
}
