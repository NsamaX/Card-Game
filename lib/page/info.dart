import 'package:flutter/material.dart';
import 'package:project/api/model/model.dart';
import 'package:project/api/service/deck.dart';
import 'package:project/widget/page/info.dart';

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          pageWidget.saveButton(
              saveEnable: widget.saveEnable, saveCard: saveCard)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: ListView(
          children: [
            Column(
              children: [
                pageWidget.image(card: widget.card),
                SizedBox(height: 10),
                pageWidget.info(card: widget.card),
                SizedBox(height: 10),
                pageWidget.addBar(
                    saveEnable: widget.saveEnable,
                    count: count,
                    selectedIndex: selectedIndex,
                    onTap: cardCount),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void saveCard() async {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Card with the same name already exists in the deck'),
      ),
    );
    DeckService().save(
        game: widget.game, card: widget.card, cardCount: count[selectedIndex]);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Save Card Successfully')),
    );

    Navigator.of(context).pop();
  }

  void cardCount(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  final List<int> count = [1, 2, 3, 4];
  int selectedIndex = 0;

  late final InfoWidget pageWidget = InfoWidget(context: context);
}

class InfoPage extends StatefulWidget {
  final String game;
  final Model card;
  final bool saveEnable;

  const InfoPage(
      {Key? key, String? game, required this.card, required this.saveEnable})
      : game = game ?? 'none',
        super(key: key);

  @override
  _InfoPageState createState() => _InfoPageState();
}
