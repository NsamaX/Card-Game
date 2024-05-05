// TODO: create function for filter card

import 'package:flutter/material.dart';
import 'package:project/api/cfv.dart';
import 'package:project/page/deck.dart';
import 'package:project/service/board/cfv/filter.dart';
import 'package:project/service/card.dart';
import 'package:project/widget/box/box.dart';
import 'package:project/widget/card/book.dart';
import 'package:project/widget/appBar.dart';

class _cardListBookPageState extends State<BookPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        menuItem: [
          Icons.arrow_back_rounded,
          'Card Info',
          Icons.filter_list_rounded
        ],
        onTapmenuItem: [back, null, filter],
      ),
      body: Stack(
        children: [
          Book(
              cardList: cardList,
              scrollController: scrollController,
              saveEnable: widget.saveEnable),
          if (isLoading)
            Align(
                alignment: cardList.isEmpty
                    ? Alignment.center
                    : Alignment.bottomCenter,
                child: CircularProgressIndicator()),
          Box().filter(FilterService().getFilter(), filterBoxVisible, 260, 460),
        ],
      ),
    );
  }

  void back() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => DeckPage()),
    );
  }

  void filter() {
    setState(() {
      filterBoxVisible = !filterBoxVisible;
    });
  }

  Future<void> getData(String search, int page) async {
    if (!mounted) return;
    setState(() {
      isLoading = true;
    });
    List<Model> fetchedData =
        await CardService(game: 'cfv').getData(search, page);
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
        !scrollController.position.outOfRange) getData(search, currentPage);
  }

  @override
  void initState() {
    super.initState();
    cardList = [];
    getData(search, currentPage);
    scrollController.addListener(scrollListener);
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  bool filterBoxVisible = false;
  bool isLoading = false;
  int currentPage = 1;
  late List<Model> cardList;

  final ScrollController scrollController = ScrollController();
  final String search = "cards";
}

class BookPage extends StatefulWidget {
  final bool saveEnable;

  const BookPage({Key? key, required bool save})
      : saveEnable = save,
        super(key: key);

  @override
  State<BookPage> createState() => _cardListBookPageState();
}
