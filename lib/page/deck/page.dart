import 'package:flutter/material.dart';
import 'package:project/api/model/cfv.dart';
import 'package:project/api/service/deck.dart';
import 'package:project/widget/appBar.dart';
import 'package:project/widget/buttomNav.dart';
import 'package:project/widget/card/list.dart';
import 'icons.dart';

class DeckPage extends StatefulWidget {
  const DeckPage({Key? key}) : super(key: key);

  @override
  State<DeckPage> createState() => _DeckPageState();
}

class _DeckPageState extends State<DeckPage> {
  final ScrollController _scrollController = ScrollController();
  List<CardData> myDeck = [];
  bool editDeck = false;

  void deleteDeckState() {
    setState(() {
      myDeck = [];
    });
  }

  void editDeckState() {
    loadDeck().then((cards) {
      setState(() {
        editDeck = !editDeck;
        myDeck = cards;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    loadDeck().then((cards) {
      setState(() {
        myDeck = cards;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        context: context,
        menus: menus,
        onTap:
            getOnTap(context, myDeck, deleteDeckState, editDeckState),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CardList(
          scrollController: _scrollController,
          cardList: myDeck,
          buildDeck: false,
          editDeck: editDeck,
        ),
      ),
      bottomNavigationBar: BottomNav(currentIndex: 0),
    );
  }
}
