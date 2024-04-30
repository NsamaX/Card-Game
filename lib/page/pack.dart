import 'package:flutter/material.dart';
import 'package:project/api/model.dart';
import 'package:project/service/deck.dart';
import 'package:project/widget/appBar.dart';
import 'package:project/widget/buttomNav.dart';
import 'package:project/widget/cardList.dart';
import 'cardDB.dart';

class pack extends StatefulWidget {
  const pack({Key? key}) : super(key: key);

  @override
  State<pack> createState() => _packState();
}

class _packState extends State<pack> {
  final ScrollController _scrollController = ScrollController();
  final deck _service = deck();
  List<model> _deck = [];
  bool _isEdit = false;

  void _draw() {}

  void _share() {}

  void _search() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => cardDB(save: false),
      ),
    );
  }

  void _delete() {
    if (_deck.isEmpty) return;
    _service.delete().then(
      (_) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Deleted deck successfully')),
        );
        setState(() {
          _deck = [];
        });
      },
    );
  }

  void _add() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => cardDB(save: true),
      ),
    );
  }

  void _edit() {
    _service.load().then(
      (deck) {
        setState(() {
          _isEdit = !_isEdit;
          _deck = deck;
        });
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _service.load().then(
      (deck) {
        setState(() {
          _deck = deck;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        menu: _isEdit
            ? [
                Icons.delete_rounded,
                null,
                'My Deck',
                Icons.add_rounded,
                'Done',
              ]
            : [
                Icons.menu_rounded,
                Icons.ios_share_rounded,
                'My Deck',
                Icons.search_rounded,
                'Edit',
              ],
        onTap: _isEdit
            ? [
                _delete,
                () {},
                () {},
                _add,
                _edit,
              ]
            : [
                _draw,
                _share,
                () {},
                _search,
                _edit,
              ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: cardList(
          scrollController: _scrollController,
          card: _deck,
          edit: _isEdit,
        ),
      ),
      bottomNavigationBar: bottomNav(currentIndex: 0),
    );
  }
}
