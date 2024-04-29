import 'package:flutter/material.dart';
import 'package:project/api/model.dart';
import 'package:project/page/single/page.dart';

class CARD extends StatelessWidget {
  final model _card;
  final bool _show;
  final bool _build;

  const CARD({
    Key? key,
    required model card,
    required bool show,
    required bool build,
  })  : _card = card,
        _show = show,
        _build = build,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
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
        child: Card(
          elevation: 4.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return ClipRRect(
                child: AspectRatio(
                  aspectRatio: 8 / 12,
                  child: Image.network(
                    _show ? _card.getImage() : _card.getSleeve(),
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
