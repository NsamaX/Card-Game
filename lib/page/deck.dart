// TODO: create function for share deck
// TODO: load deck by deck name

import 'package:flutter/material.dart';
import 'package:project/api/model/cfv.dart';
import 'package:project/page/book.dart';
import 'package:project/service/deck.dart';
import 'package:project/widget/appBar.dart';
import 'package:project/widget/buttomNav.dart';
import 'package:project/widget/card/book.dart';

class DeckPage extends StatefulWidget {
  const DeckPage({Key? key}) : super(key: key);

  @override
  State<DeckPage> createState() => _DeckPageState();
}

class _DeckPageState extends State<DeckPage> {
  bool editEnable = false;
  late List<Model> deck;

  final ScrollController scrollController = ScrollController();

  void menu() {}

  void share() {}

  void search() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => BookPage(save: false)),
    );
  }

  void edit() {
    DeckService().load().then(
      (deck) {
        setState(() {
          editEnable = !editEnable;
          deck = deck;
        });
      },
    );
  }

  void delete() {
    if (deck.isEmpty) return;
    DeckService().delete().then(
      (_) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Deleted deck successfully')),
        );
        setState(() {
          deck = [];
        });
      },
    );
  }

  void add() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => BookPage(save: true),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    deck = [];
    DeckService().load().then(
      (load) {
        setState(() {
          deck = load;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        menuItem: editEnable
            ? [Icons.delete_rounded, null, 'My Deck', Icons.add_rounded, 'Done']
            : [
                Icons.window_rounded,
                Icons.ios_share_rounded,
                'My Deck',
                Icons.search_rounded,
                'Edit'
              ],
        onTapmenuItem: editEnable
            ? [delete, null, null, add, edit]
            : [menu, share, null, search, edit],
      ),
      body: Book(
          scrollController: scrollController,
          cardList: deck,
          editEnable: editEnable),
      bottomNavigationBar: BottomNavigation(currentIndex: 0),
    );
  }
}
