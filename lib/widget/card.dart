import 'package:flutter/material.dart';
import 'package:project/api/model/cfv.dart';
import 'package:project/api/service/deck.dart';
import 'package:project/page/card/contents.dart';
import 'action.dart';

class carD extends StatelessWidget {
  final CardData _card;
  final bool _build;
  final bool _edit;

  const carD({
    Key? key,
    required CardData card,
    required bool build,
    required bool edit,
  })  : _card = card,
        _build = build,
        _edit = edit,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => CardInfoPage(
                  model: _card,
                  save: _build,
                ),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(14.0),
                    child: AspectRatio(
                      aspectRatio: 8 / 12,
                      child: Image.network(
                        _card.getImage(),
                        fit: BoxFit.cover,
                        loadingBuilder: (BuildContext context, Widget child,
                            ImageChunkEvent? loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          }
                          return Container(
                            child: Center(
                              child: CircularProgressIndicator(
                                value: loadingProgress.expectedTotalBytes !=
                                        null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes!
                                    : null,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
        if (_edit)
          actioN(
            card: _card,
            onAdd: () {
              _card.addCard();
              updateDeck(_card, _card.getCount());
            },
            onRemove: () {
              _card.removeCard();
              updateDeck(_card, _card.getCount());
            },
          ),
      ],
    );
  }
}
