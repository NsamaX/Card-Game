import 'package:flutter/material.dart';
import 'package:project/api/model/cfv.dart';
import 'package:project/api/model/savedCard.dart';
import 'package:project/api/service/deck.dart';
import 'package:project/widget/app_bar.dart';
import 'package:project/widget/buttom_nav.dart';
import 'package:project/widget/card/list.dart';
import 'icons.dart';

class DeckPage extends StatefulWidget {
  const DeckPage({Key? key}) : super(key: key);

  @override
  State<DeckPage> createState() => _DeckPageState();
}

class _DeckPageState extends State<DeckPage> {
  final ScrollController _scrollController = ScrollController();
  List<SaveCard> myDeck = [];

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
    List<CardData> cardDataList =
        myDeck.map((saveCard) => saveCard.card).toList();
    return Scaffold(
      appBar: CustomAppBar(
        context: context,
        icons: icons,
        onTapCallbacks: getOnTapCallbacks(context, myDeck),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CardList(
          cardDataList: cardDataList,
          scrollController: _scrollController,
          buildDeck: false,
        ),
      ),
      bottomNavigationBar: BottomNav(currentIndex: 0),
    );
  }
}
