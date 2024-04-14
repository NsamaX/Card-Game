import 'package:flutter/material.dart';
import 'package:project/api/model/cfv.dart';
import 'package:project/api/service/deck.dart';
import 'package:project/widget/card/app_bar.dart';
import 'package:project/widget/card/card_bar.dart';

class CardInfoPage extends StatefulWidget {
  final CardData card;
  final bool save;

  const CardInfoPage({
    Key? key,
    required this.card,
    required this.save,
  }) : super(key: key);

  @override
  _CardInfoPageState createState() => _CardInfoPageState();
}

class _CardInfoPageState extends State<CardInfoPage> {
  final List<Map<String, dynamic>> data = [
    {'data': '', 'value': 1},
    {'data': '', 'value': 2},
    {'data': '', 'value': 3},
    {'data': '', 'value': 4},
  ];
  int selectedIndex = 0;

  void handleSave() {
    saveCard(widget.card, data[selectedIndex]['value']);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Save Card Successfully')),
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        save: widget.save,
        onSave: handleSave,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
        child: ListView(shrinkWrap: true, children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(14.0),
                    child: Image.network(
                      widget.card.getImage(),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              for (var entry
                  in widget.card.getCardDataMap().entries)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${entry.key}: ${entry.value}',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              Visibility(
                visible: widget.save,
                child: CardBar(
                  data: data,
                  onSelectValue: (index) {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
