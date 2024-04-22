import 'package:flutter/material.dart';
import 'package:project/api/model/cfv.dart';
import 'package:project/api/service/deck.dart';
import 'package:project/widget/cardBar.dart';
import 'package:project/widget/save.dart';

class CardInfoPage extends StatefulWidget {
  final CardData model;
  final bool save;

  const CardInfoPage({
    Key? key,
    required this.model,
    required this.save,
  }) : super(key: key);

  @override
  _CardInfoPageState createState() => _CardInfoPageState();
}

class _CardInfoPageState extends State<CardInfoPage> {
  final List<Map<String, dynamic>> data = [
    {'text': '', 'value': 1},
    {'text': '', 'value': 2},
    {'text': '', 'value': 3},
    {'text': '', 'value': 4},
  ];
  int selectedIndex = 0;

  void handleSave() {
    saveCard(widget.model, data[selectedIndex]['value']);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Save Card Successfully')),
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: savE(
        save: widget.save,
        onTap: handleSave,
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
                      widget.model.getImage(),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              for (var entry
                  in widget.model.getDataMap().entries)
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
                child: carDbaR(
                  data: data,
                  onTap: (index) {
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
