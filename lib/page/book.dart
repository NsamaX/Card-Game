// TODO: create function for filter card

import 'package:flutter/material.dart';
import 'package:project/api/model/model.dart';
import 'package:project/api/service/board/cfv/filter.dart';
import 'package:project/api/service/card.dart';
import 'package:project/page/deck.dart';
import 'package:project/widget/box/box.dart';
import 'package:project/widget/card/book.dart';
import 'package:project/widget/appBar.dart';

class _BookPageState extends State<BookPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(menu: {
        Icons.arrow_back_rounded: back,
        'Card Info': null,
        Icons.filter_list_rounded: filter
      }),
      body: Stack(
        children: [
          Book(
              scrollController: scrollController,
              game: widget.game,
              cardList: cardList,
              saveEnable: widget.saveEnable),
          if (isLoading)
            Align(
                alignment: cardList.isEmpty
                    ? Alignment.center
                    : Alignment.bottomCenter,
                child: CircularProgressIndicator()),
          BoxWidget().filter(
              filter: FilterService().getFilter(),
              filterBoxVisible: filterBoxVisible,
              filterBoxWidth: 260,
              filterBoxHeight: 460),
        ],
      ),
    );
  }

  void back() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => DeckPage(game: widget.game)),
    );
  }

  void filter() {
    setState(() {
      filterBoxVisible = !filterBoxVisible;
    });
  }

  Future<void> getData({required String search, required int page}) async {
    if (!mounted) return;
    setState(() {
      isLoading = true;
    });
    List<Model> fetchedData = await CardService(game: widget.game)
        .getData(game: widget.game, search: search, page: page);
    if (!mounted) return;
    setState(() {
      if (page == 1)
        cardList = fetchedData;
      else
        cardList.addAll(fetchedData);
      currentPage = page + 1;
      isLoading = false;
    });
  }

  void scrollListener() {
    if (scrollController.offset >= scrollController.position.maxScrollExtent &&
        !scrollController.position.outOfRange)
      getData(search: search, page: currentPage);
  }

  @override
  void initState() {
    super.initState();
    getData(search: search, page: currentPage);
    scrollController.addListener(scrollListener);
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  bool filterBoxVisible = false;
  bool isLoading = false;
  List<Model> cardList = [];

  final String search = "cards";
  int currentPage = 1;

  final ScrollController scrollController = ScrollController();
}

class BookPage extends StatefulWidget {
  final String game;
  final bool saveEnable;

  const BookPage({Key? key, required this.game, required bool save})
      : saveEnable = save,
        super(key: key);

  @override
  State<BookPage> createState() => _BookPageState();
}
