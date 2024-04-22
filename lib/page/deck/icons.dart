import 'package:flutter/material.dart';
import 'package:project/api/model/cfv.dart';
import 'package:project/api/service/deck.dart';
import 'package:project/page/card/page.dart';

List<dynamic> icons = [
  Icons.delete_rounded,
  Icons.ios_share_rounded,
  'My Deck',
  Icons.add_rounded,
  'Edit',
];

typedef void DeleteDeckCallback();
typedef void EditDeckCallback();

List<Function> getOnTapCallbacks(BuildContext context, List<CardData> myDeck,
    DeleteDeckCallback deleteDeckCallback, EditDeckCallback editDeckState) {
  return [
    () {
      deleteDeck().then((_) {
        myDeck.clear();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Deleted deck successfully'),
          ),
        );
        deleteDeckCallback();
      });
    },
    () {},
    () {},
    () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => CardsPage(page: 'deck', save: true),
        ),
      );
    },
    () {
      editDeckState();
    },
  ];
}
