import 'package:flutter/material.dart';
import 'package:project/api/model/cfv.dart';
import 'package:project/theme/color.dart';

class Board extends StatefulWidget {
  final List<List<String>> field;
  final List<CardData> deck;
  List<List<List<CardData?>>> card = [];

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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
      child: Column(
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
      child: Padding(
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
                if (cards != null)
                  for (int i = 0; i < cards.length; i++) ...[
                    if (cards[i] != null) buildDraggableCard(cards[i]!),
                  ],
              ],
            );
          },
          onAccept: (data) {
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
          },
        ),
      ),
    );
  }

  Widget buildDraggableCard(CardData cardData) {
    return Draggable<CardData>(
      data: cardData,
      child: buildCard(cardData.getImage()),
      feedback: buildCard(cardData.getImage()),
      childWhenDragging: Container(),
      onDragStarted: () {
        setState(() {
          _draggedCard = cardData;
        });
      },
      onDragCompleted: () {
        setState(() {
          _draggedCard = null;
        });
      },
      onDraggableCanceled: (Velocity velocity, Offset offset) {
        setState(() {
          _draggedCard = null;
        });
      },
    );
  }

  Widget buildCard(String image) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Image.network(
        image,
        fit: BoxFit.cover,
        height: 80.0,
      ),
    );
  }
}
