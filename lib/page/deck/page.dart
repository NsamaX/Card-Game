import 'package:flutter/material.dart';
import 'package:project/api/model.dart';
import 'package:project/service/deck.dart';
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
  final deck _d = deck();
  List<model> _deck = [];
  bool _onEdit = false;

  void delete() {
    setState(() {
      _deck = [];
    });
  }

  void edit() {
    _d.load().then(
      (deck) {
        setState(() {
          _onEdit = !_onEdit;
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
        menU(context: context, delete: delete, edit: edit, onEdit: _onEdit);

    return Scaffold(
      appBar: appBar(
        menu: _m.getMenu(),
        onTap: _m.getOnTap(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: list(
          scrollController: _scrollController,
          card: _deck,
          edit: _onEdit,
        ),
      ),
      bottomNavigationBar: bottomNav(currentIndex: 0),
    );
  }
}
