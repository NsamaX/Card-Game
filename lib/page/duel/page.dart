import 'package:flutter/material.dart';
import 'package:project/api/model/cfv.dart';
import 'package:project/api/service/deck.dart';
import 'package:project/widget/appBar.dart';
import 'package:project/widget/board/board.dart';
import 'package:project/widget/buttomNav.dart';
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
      appBar: appBar(
        context: context,
        menus: menus,
        onTap: getOnTap(context),
      ),
      body: Board(
        field: field,
        deck: myDeck,
      ),
      bottomNavigationBar: BottomNav(currentIndex: 1),
    );
  }
}
