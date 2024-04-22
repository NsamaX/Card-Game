import 'package:flutter/material.dart';
import 'package:project/api/model/cfv.dart';
import 'package:project/api/service/deck.dart';
import 'package:project/widget/appBar.dart';
import 'package:project/widget/buttomNav.dart';
import 'package:project/widget/list.dart';
import 'menu.dart';

class DeckPage extends StatefulWidget {
  const DeckPage({Key? key}) : super(key: key);

  @override
  State<DeckPage> createState() => _DeckPageState();
}

class _DeckPageState extends State<DeckPage> {
  final ScrollController _scrollController = ScrollController();
  List<CardData> myDeck = [];
  bool edit = false;

  void deleteDeckState() {
    setState(() {
      myDeck = [];
    });
  }

  void editState() {
    loadDeck().then((cards) {
      setState(() {
        edit = !edit;
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
    menu _m = menu();

    return Scaffold(
      appBar: apPbaR(
        menu: _m.getMenu(),
        onTap: _m.getOnTap(context, myDeck, deleteDeckState, editState),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: lisT(
          scrollController: _scrollController,
          card: myDeck,
          build: false,
          edit: edit,
        ),
      ),
      bottomNavigationBar: bottoMnaV(currentIndex: 0),
    );
  }
}
