// TODO: create function for share deck
// TODO: load deck by deck name

import 'package:flutter/material.dart';
import 'package:project/api/model/cfv.dart';
import 'package:project/page/book.dart';
import 'package:project/service/deck.dart';
import 'package:project/widget/appBar.dart';
import 'package:project/widget/buttomNav.dart';
import 'package:project/widget/card/book.dart';

class _DeckPageState extends State<DeckPage> {
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
      bottomNavigationBar: BottomNavigation(currentIndex: 0, game: widget.game),
    );
  }

  void menu() {}

  void share() {}

  void search() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) => BookPage(game: widget.game, save: false)),
    );
  }

  void edit() {
    DeckService().load().then(
      (load) {
        setState(() {
          editEnable = !editEnable;
          deck = load;
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
        builder: (context) => BookPage(game: widget.game, save: true),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    DeckService().load().then(
      (load) {
        setState(() {
          deck = load;
        });
      },
    );
  }

  bool editEnable = false;
  List<Model> deck = [];

  final ScrollController scrollController = ScrollController();
}

class DeckPage extends StatefulWidget {
  final String game;

  const DeckPage({Key? key, required this.game}) : super(key: key);

  @override
  State<DeckPage> createState() => _DeckPageState();
}
