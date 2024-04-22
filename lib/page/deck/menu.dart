import 'package:flutter/material.dart';
import 'package:project/api/model/cfv.dart';
import 'package:project/api/service/deck.dart';
import '../card/page.dart';

class menu {
  final List<dynamic> _menu = [
    Icons.ios_share_rounded,
    Icons.delete_rounded,
    'My Deck',
    Icons.add_rounded,
    'Edit',
  ];

  List<dynamic> getMenu() => _menu;

  List<Function> getOnTap(BuildContext context, List<CardData> myDeck,
      Function delete, Function edit) {
    return [
      () {},
      () => _onDelete(context, myDeck, delete),
      () {},
      () => _onAdd(context),
      () => _onEdit(edit),
    ];
  }

  void _onDelete(BuildContext context, List<CardData> myDeck, Function delete) {
    deleteDeck().then((_) {
      myDeck.clear();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Deleted deck successfully'),
        ),
      );
      delete();
    });
  }

  void _onAdd(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => CardsPage(page: 'deck', save: true),
      ),
    );
  }

  void _onEdit(Function edit) {
    edit();
  }
}
