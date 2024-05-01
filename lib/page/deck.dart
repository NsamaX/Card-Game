import 'package:flutter/material.dart';
import 'package:project/api/model.dart';
import 'package:project/service/deck.dart';
import 'package:project/widget/appBar.dart';
import 'package:project/widget/buttomNav.dart';
import 'package:project/widget/cardList.dart';
import 'cardBook.dart';

class DeckPage extends StatefulWidget {
  const DeckPage({Key? key}) : super(key: key);

  @override
  State<DeckPage> createState() => _DeckPageState();
}

class _DeckPageState extends State<DeckPage> {
  final Deck _deckService = Deck();

  final ScrollController _scrollController = ScrollController();
  List<Model> _deck = [];
  bool _isEdit = false;

  void _draw() {}

  void _share() {}

  void _search() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => CardBookPage(save: false),
      ),
    );
  }

  void _delete() {
    if (_deck.isEmpty) return;
    _deckService.delete().then(
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
        builder: (context) => CardBookPage(save: true),
      ),
    );
  }

  void _edit() {
    _deckService.load().then(
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
    _deckService.load().then(
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
      appBar: CustomAppBar(
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
        child: CardList(
          scrollController: _scrollController,
          card: _deck,
          edit: _isEdit,
        ),
      ),
      bottomNavigationBar: BottomNavigation(currentIndex: 0),
    );
  }
}
