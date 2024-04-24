import 'package:flutter/material.dart';
import 'package:project/api/model/cfv.dart';
import 'package:project/page/single/page.dart';

class carD extends StatelessWidget {
  final CardData _card;
  final bool _build;

  const carD({
    Key? key,
    required CardData card,
    required bool build,
  })  : _card = card,
        _build = build,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => singlE(
              card: _card,
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
                            value: loadingProgress.expectedTotalBytes != null
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
    );
  }
}
