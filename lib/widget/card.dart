import 'package:flutter/material.dart';
import 'package:project/api/model.dart';
import 'package:project/page/cardInfo.dart';

class CARD extends StatelessWidget {
  final Model _card;
  final bool _save;
  final bool _show;
  final bool _info;

  const CARD(
      {Key? key,
      required Model card,
      required bool save,
      bool? show,
      bool? info})
      : _card = card,
        _save = save,
        _show = show ?? true,
        _info = info ?? true,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          if (_info)
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => CardInfoPage(
                  card: _card,
                  save: _save,
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
                borderRadius: BorderRadius.circular(8.0),
                child: AspectRatio(
                  aspectRatio: 8 / 12,
                  child: Image.network(
                    _show ? _card.getImage() : _card.getSleeve(),
                    fit: BoxFit.cover,
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) return child;
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
