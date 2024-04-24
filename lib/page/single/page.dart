import 'package:flutter/material.dart';
import 'package:project/api/model/cfv.dart';
import 'package:project/api/service/deck.dart';
import 'package:project/widget/backBar.dart';
import 'package:project/widget/cardBar.dart';
import 'package:project/widget/info.dart';
import 'content.dart';

class singlE extends StatefulWidget {
  final CardData _card;
  final bool _save;

  const singlE({
    Key? key,
    required CardData card,
    required bool save,
  })  : _card = card,
        _save = save,
        super(key: key);

  @override
  _singlEState createState() => _singlEState();
}

class _singlEState extends State<singlE> {
  final contenT _c = contenT();
  final decK _d = decK();
  int _selectedIndex = 0;

  void handleSave() async {
    bool cardExists = await _d.check(widget._card.getName());

    if (cardExists) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content:
                Text('Card with the same name already exists in the deck')),
      );
    } else {
      _d.save(widget._card, _c.getValue(_selectedIndex));
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Save Card Successfully')),
      );
    }
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: bacKbaR(
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
                infO(card: widget._card),
                Visibility(
                  visible: widget._save,
                  child: carDbaR(
                    data: _c.getBar(),
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