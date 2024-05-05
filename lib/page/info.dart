import 'package:flutter/material.dart';
import 'package:project/api/cfv.dart';
import 'package:project/service/deck.dart';
import 'package:project/widget/page/info.dart';

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [pageWidget.saveButton(widget.saveEnable, saveCard)],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: ListView(
          children: [
            Column(
              children: [
                pageWidget.image(widget.card),
                SizedBox(height: 10),
                pageWidget.info(widget.card),
                SizedBox(height: 10),
                pageWidget.addBar(
                    widget.saveEnable, count, cardCount, selectedIndex),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void saveCard() async {
    bool cardExists = await DeckService().check(widget.card.getName());
    if (cardExists)
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Card with the same name already exists in the deck'),
        ),
      );
    else {
      DeckService().save(widget.card, count[selectedIndex]);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Save Card Successfully')),
      );
    }
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
  final Model card;
  final bool saveEnable;

  const InfoPage({Key? key, required this.card, required this.saveEnable})
      : super(key: key);

  @override
  _InfoPageState createState() => _InfoPageState();
}
