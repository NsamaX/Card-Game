import 'package:flutter/material.dart';
import 'package:project/api/model/model.dart';
import 'package:project/page/info.dart';

class _CARDState extends State<CARD> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.showCardInfo)
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) =>
                  InfoPage(card: widget.card, saveEnable: widget.saveEnable),
            ),
          );
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: AspectRatio(
                aspectRatio: 8 / 12,
                child: Image.network(
                  widget.showCardImage
                      ? widget.card.getImage()
                      : widget.card.getSleeve(),
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
    );
  }
}

class CARD extends StatefulWidget {
  final Model card;
  final bool saveEnable;
  final bool showCardImage;
  final bool showCardInfo;

  const CARD(
      {Key? key,
      required this.card,
      required this.saveEnable,
      bool? showCardImage,
      bool? showCardInfo})
      : showCardImage = showCardImage ?? true,
        showCardInfo = showCardInfo ?? true,
        super(key: key);

  @override
  State<CARD> createState() => _CARDState();
}
