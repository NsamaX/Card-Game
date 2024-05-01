import 'package:flutter/material.dart';
import 'package:project/api/model.dart';
import 'package:project/service/deck.dart';
import 'package:project/widget/addBar.dart';
import 'package:project/widget/cardInfo.dart';

class single extends StatefulWidget {
  final model _card;
  final bool _save;

  const single({
    Key? key,
    required model card,
    required bool save,
  })  : _card = card,
        _save = save,
        super(key: key);

  @override
  _singleState createState() => _singleState();
}

class _singleState extends State<single> {
  final deck _service = deck();
  final List<int> _count = [1, 2, 3, 4];
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
    final ThemeData _theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Text('', style: _theme.textTheme.titleSmall),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 22.0),
            child: GestureDetector(
              onTap: handleSave,
              child: Text(widget._save ? 'Save' : ''),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
        child: ListView(
          shrinkWrap: true,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CardInfo(card: widget._card),
                Visibility(
                  visible: widget._save,
                  child: AddBar(
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
