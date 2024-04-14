import 'package:flutter/material.dart';
import 'package:project/api/model/cfv.dart';
import 'package:project/api/model/sleeve.dart';
import 'package:project/theme/color.dart';
import 'action/operator.dart';

class Board extends StatefulWidget {
  final List<List<String>> field;
  final List<CardData> deck;
  List<List<List<CardData?>>> card = [];
  final Sleeve sleeve = Sleeve();

  Board({
    Key? key,
    required this.field,
    required this.deck,
  }) : super(key: key) {
    for (int i = 0; i < field.length; i++) {
      card.add([]);
      for (int j = 0; j < field[i].length; j++) {
        card[i].add([]);
        if (field[i][j] == 'Main\nDeck') {
          card[i][j] = deck;
        } else {
          card[i][j].add(null);
        }
      }
    }
  }

  @override
  _BoardState createState() => _BoardState();
}

class _BoardState extends State<Board> {
  CardData? _draggedCard;
  bool _isLoading = true;
  bool _disposed = false;

  @override
  void initState() {
    super.initState();
    // Preload all images
    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      await precacheImages();
      if (!_disposed) {
        setState(() {
          _isLoading = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }

  Future<void> precacheImages() async {
    for (var cardList in widget.card) {
      for (var sublist in cardList) {
        for (var cardData in sublist) {
          if (cardData != null && !_disposed) {
            await precacheImage(NetworkImage(cardData.getImage()), context);
          }
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
      child: _isLoading
          ? Center(child: CircularProgressIndicator())
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < widget.field.length; i++)
                  Row(
                    children: [
                      for (int j = 0; j < widget.field[i].length; j++)
                        buildField(widget.card[i][j], widget.field[i][j]),
                    ],
                  ),
              ],
            ),
    );
  }

  Widget buildField(List<CardData?>? cards, String field) {
    return Expanded(
      child: Stack(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: DragTarget<CardData>(
            builder: (BuildContext context, List<CardData?> candidateData,
                List<dynamic> rejectedData) {
              return Stack(
                children: [
                  Container(
                    height: 80.0,
                    decoration: BoxDecoration(
                      color: mainColor3,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Center(
                      child: Text(
                        field,
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.4),
                          fontSize: 12.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  if (cards != null) ...[
                    for (int i = 0; i < cards.length; i++)
                      if (cards[i] != null)
                        buildDraggableCard(
                            (field == 'Main\nDeck' || field == 'Special\nDeck')
                                ? true
                                : false,
                            cards[i]!),
                  ],
                ],
              );
            },
            onAccept: (data) {
              if (!_disposed) {
                setState(() {
                  if (_draggedCard != null) {
                    for (int i = 0; i < widget.card.length; i++) {
                      for (int j = 0; j < widget.card[i].length; j++) {
                        if (widget.card[i][j].contains(_draggedCard)) {
                          widget.card[i][j].remove(_draggedCard);
                          break;
                        }
                      }
                    }
                    cards?.add(_draggedCard);
                  }
                });
              }
            },
          ),
        ),
        // CardOperator(
        //   flip: () {},
        //   search: () {},
        //   rest: () {},
        // ),
      ]),
    );
  }

  Widget buildDraggableCard(bool hide, CardData cardData) {
    return Draggable<CardData>(
      data: cardData,
      child: buildCard(hide, cardData.getImage()),
      feedback: buildCard(hide, cardData.getImage()),
      childWhenDragging: Container(),
      onDragStarted: () {
        if (!_disposed) {
          setState(() {
            _draggedCard = cardData;
          });
        }
      },
      onDragCompleted: () {
        if (!_disposed) {
          setState(() {
            _draggedCard = null;
          });
        }
      },
      onDraggableCanceled: (Velocity velocity, Offset offset) {
        if (!_disposed) {
          setState(() {
            _draggedCard = null;
          });
        }
      },
    );
  }

  Widget buildCard(bool hide, String image) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Image.network(
        (hide) ? widget.sleeve.getSleeve() : image,
        fit: BoxFit.cover,
        height: 80.0,
        width: 80 * 0.75,
      ),
    );
  }
}
