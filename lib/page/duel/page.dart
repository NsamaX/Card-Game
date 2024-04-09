import 'package:flutter/material.dart';
import 'package:project/api/model/cfv.dart';
import 'package:project/api/service/deck.dart';
import 'package:project/widget/app_bar.dart';
import 'package:project/widget/board.dart';
import 'package:project/widget/buttom_nav.dart';
import 'contents.dart';
import 'icons.dart';

class DuelPage extends StatefulWidget {
  const DuelPage({Key? key}) : super(key: key);

  @override
  State<DuelPage> createState() => _DuelPageState();
}

class _DuelPageState extends State<DuelPage> {
  List<CardData> myDeck = [];

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
      appBar: CustomAppBar(
        context: context,
        icons: icons,
        onTapCallbacks: getOnTapCallbacks(context),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 0; i < text.length; i++) Board.buildRow(text[i]),
          ],
        ),
      ),
      bottomNavigationBar: BottomNav(currentIndex: 1),
    );
  }
}
