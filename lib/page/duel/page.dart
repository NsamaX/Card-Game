import 'package:flutter/material.dart';
import 'package:project/api/model/cfv.dart';
import 'package:project/api/service/deck.dart';
import 'package:project/widget/appBar.dart';
import 'package:project/widget/board.dart';
import 'package:project/widget/buttomNav.dart';
import 'contents.dart';
import 'menu.dart';

class DuelPage extends StatefulWidget {
  const DuelPage({Key? key}) : super(key: key);

  @override
  State<DuelPage> createState() => _DuelPageState();
}

class _DuelPageState extends State<DuelPage> {
  decK _d = decK();
  List<CardData> _deck = [];

  @override
  void initState() {
    super.initState();
    _d.load().then((cards) {
      setState(() {
        _deck = cards;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    contenT _c = contenT();
    menU _m = menU(context: context);

    return Scaffold(
      appBar: apPbaR(
        menu: _m.getMenu(),
        onTap: _m.getOnTap(),
      ),
      body: Board(
        field: _c.getField(),
        deck: _deck,
      ),
      bottomNavigationBar: bottoMnaV(currentIndex: 1),
    );
  }
}
