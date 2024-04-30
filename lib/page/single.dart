import 'package:flutter/material.dart';
import 'package:project/api/model.dart';
import 'package:project/service/deck.dart';
import 'package:project/widget/backAppBar.dart';
import 'package:project/widget/cardInfo.dart';
import 'package:project/widget/infoBar.dart';

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
  final deck _service = deck();
  final List<int> _count = [
    1,
    2,
    3,
    4,
  ];
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
      _service.save(widget._card, _count[_selectedIndex]);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Save Card Successfully')),
      );
    }
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: backAppBar(
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
                cardInfo(card: widget._card),
                Visibility(
                  visible: widget._save,
                  child: infoBar(
                    count: _count,
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
