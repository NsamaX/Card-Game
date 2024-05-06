// TODO: create function for share deck
// TODO: load deck by deck name

import 'package:flutter/material.dart';
import 'package:project/api/model/model.dart';
import 'package:project/api/service/deck.dart';
import 'package:project/page/book.dart';
import 'package:project/widget/appBar.dart';
import 'package:project/widget/buttomNav.dart';
import 'package:project/widget/card/book.dart';

class _DeckPageState extends State<DeckPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          menu: editEnable
              ? {
                  Icons.delete_rounded: delete,
                  null: null,
                  'My Deck': null,
                  Icons.add_rounded: add,
                  'Done': edit
                }
              : {
                  Icons.window_rounded: menu,
                  Icons.ios_share_rounded: share,
                  'My Deck': null,
                  Icons.search_rounded: search,
                  'Edit': edit
                }),
      body: Book(
          scrollController: scrollController,
          game: widget.game,
          cardList: deck,
          editEnable: editEnable),
      bottomNavigationBar: BottomNavigation(game: widget.game, currentIndex: 0),
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
    DeckService().load(game: widget.game).then(
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
    DeckService().load(game: widget.game).then(
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
