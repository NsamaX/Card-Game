import 'package:flutter/material.dart';
import 'package:project/api/model.dart';
import 'package:project/service/deck.dart';
import 'package:project/widget/back.dart';
import 'package:project/widget/bar.dart';
import 'package:project/widget/info.dart';

class singlE extends StatefulWidget {
  final model _card;
  final bool _save;

  const singlE({
    Key? key,
    required model card,
    required bool save,
  })  : _card = card,
        _save = save,
        super(key: key);

  @override
  _singlEState createState() => _singlEState();
}

class _singlEState extends State<singlE> {
  final List<dynamic> _bar = [
    {'text': '', 'value': 1},
    {'text': '', 'value': 2},
    {'text': '', 'value': 3},
    {'text': '', 'value': 4},
  ];
  final deck _service = deck();
  int _selectedIndex = 0;

  void handleSave() async {
    bool cardExists = await _service.check(widget._card.getName());

    if (cardExists) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content:
                Text('Card with the same name already exists in the deck')),
      );
    } else {
      _service.save(widget._card, _bar[_selectedIndex]['value']);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Save Card Successfully')),
      );
    }
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: back(
        title: '',
        icon: widget._save ? 'Save' : null,
        onTap: handleSave,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
        child: ListView(
          shrinkWrap: true,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                info(card: widget._card),
                Visibility(
                  visible: widget._save,
                  child: bar(
                    data: _bar,
                    onTap: (index) {
                      setState(() {
                        _selectedIndex = index;
                      });
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
