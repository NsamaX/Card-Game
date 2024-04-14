import 'package:flutter/material.dart';
import 'package:project/api/model/cfv.dart';
import 'package:project/api/service/card.dart';
import 'package:project/widget/appBar.dart';
import 'package:project/widget/buttomNav.dart';
import 'package:project/widget/card/list.dart';
import 'icons.dart';

class CardsPage extends StatefulWidget {
  final String page;
  final bool save;
  const CardsPage({Key? key, required this.page, required this.save})
      : super(key: key);

  @override
  State<CardsPage> createState() => _CardsPageState();
}

class _CardsPageState extends State<CardsPage> {
  final ScrollController _scrollController = ScrollController();
  final ApiService _apiService = ApiService();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        context: context,
        menus: menus,
        onTap: getOnTap(context, widget.page),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CardList(
              scrollController: _scrollController,
              cardList: _CardData,
              buildDeck: widget.save,
              editDeck: false,
            ),
          ),
          if (_isLoading)
            Center(
              child: CircularProgressIndicator(),
            ),
        ],
      ),
      bottomNavigationBar:
          BottomNav(currentIndex: widget.page == 'deck' ? 0 : 2),
    );
  }

  final card = "card";
  final cards = "cards";
  final sets = "sets";

  List<CardData> _CardData = [];
  int _page = 1;

  @override
  void initState() {
    super.initState();
    _getData(cards);
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      _getData(cards, page: _page + 1);
    }
  }

  Future<void> _getData(String search, {int page = 1}) async {
    if (!mounted) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    List<CardData> fetchedData = await _apiService.getData(search, page: page);
    if (!mounted) {
      return;
    }

    setState(() {
      if (page == 1) {
        _CardData = fetchedData;
      } else {
        _CardData.addAll(fetchedData);
      }
      _page = page;
      _isLoading = false;
    });
  }
}
