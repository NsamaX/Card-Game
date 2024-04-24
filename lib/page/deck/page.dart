import 'package:flutter/material.dart';
import 'package:project/api/model/cfv.dart';
import 'package:project/api/service/deck.dart';
import 'package:project/widget/appBar.dart';
import 'package:project/widget/buttomNav.dart';
import 'package:project/widget/list.dart';
import 'menu.dart';

class decKpagE extends StatefulWidget {
  const decKpagE({Key? key}) : super(key: key);

  @override
  State<decKpagE> createState() => _decKpagEState();
}

class _decKpagEState extends State<decKpagE> {
  final ScrollController _scrollController = ScrollController();
  final decK _d = decK();
  late List<dynamic> _menu;
  late List<Function> _onTap;
  List<CardData> _deck = [];
  bool _edit = false;

  void delete() {
    setState(() {
      _deck = [];
    });
  }

  void edit() {
    _d.load().then(
      (deck) {
        setState(() {
          _edit = !_edit;
          _deck = deck;
        });
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _d.load().then(
      (deck) {
        setState(() {
          _deck = deck;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final menU _m =
        menU(context: context, delete: delete, edit: edit, editMenu: _edit);
    _menu = _m.getMenu();
    _onTap = _m.getOnTap();

    return Scaffold(
      appBar: apPbaR(
        menu: _menu,
        onTap: _onTap,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: lisT(
          scrollController: _scrollController,
          card: _deck,
          build: false,
          edit: _edit,
        ),
      ),
      bottomNavigationBar: bottoMnaV(currentIndex: 0),
    );
  }
}
