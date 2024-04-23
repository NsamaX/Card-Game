import 'package:flutter/material.dart';
import 'package:project/api/model/cfv.dart';
import 'package:project/api/service/deck.dart';
import '../card/page.dart';

class menu {
  final BuildContext _context;

  menu({required BuildContext context}) : _context = context;

  final decK _d = decK();
  final List<dynamic> _menu = [
    Icons.ios_share_rounded,
    Icons.delete_rounded,
    'My Deck',
    Icons.add_rounded,
    'Edit',
  ];

  List<dynamic> getMenu() => _menu;

  List<Function> getOnTap(List<CardData> myDeck,
      Function delete, Function edit) {
    return [
      () {},
      () => _onDelete(myDeck, delete),
      () {},
      () => _onAdd(),
      () => _onEdit(edit),
    ];
  }

  void _onDelete(List<CardData> myDeck, Function deletee) {
    _d.delete().then((_) {
      myDeck.clear();
      ScaffoldMessenger.of(_context).showSnackBar(
        SnackBar(
          content: Text('Deleted deck successfully'),
        ),
      );
      deletee();
    });
  }

  void _onAdd() {
    Navigator.pushReplacement(
      _context,
      MaterialPageRoute(
        builder: (context) => CardsPage(page: 'deck', save: true),
      ),
    );
  }

  void _onEdit(Function edit) {
    edit();
  }
}
