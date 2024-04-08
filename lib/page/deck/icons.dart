import 'package:flutter/material.dart';
import 'package:project/api/model/savedCard.dart';
import 'package:project/api/service/deck.dart';
import 'addCard.dart';

List<dynamic> icons = [
  Icons.menu,
  Icons.ios_share_rounded,
  'My Deck',
  Icons.add,
  Icons.mode_edit_outline_rounded,
];

List<Function> getOnTapCallbacks(BuildContext context, List<SaveCard> myDeck) {
  return [
    () {},
    () {},
    () {},
    () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => AddCardPage()),
      );
    },
    () {
      deleteDeck().then((_) {
        myDeck.clear();
        print('clear');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Deleted deck successfully')),
        );
      });
    },
  ];
}
