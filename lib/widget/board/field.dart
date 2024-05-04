import 'package:flutter/material.dart';
import 'package:project/widget/board/moveSet.dart';
import 'package:project/widget/card/card.dart';

class FieldWidget {
  late final ThemeData theme = Theme.of(context);
  final BuildContext context;
  final double cardSize;

  FieldWidget({required this.context, required this.cardSize});

  Widget handZone(List<dynamic> playerHand, bool showCard) {
    return Align(
      alignment: showCard ? Alignment.bottomCenter : Alignment.topCenter,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: hand(playerHand, showCard),
      ),
    );
  }

  Widget hand(List<dynamic> hand, bool showCard) {
    return Container(
      height: cardSize * 1.2,
      child: hand.isNotEmpty
          ? ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: hand.length,
              itemBuilder: (BuildContext context, int index) {
                var card = hand[index];
                return CARD(
                  card: card,
                  saveEnable: false,
                  showCardImage: showCard,
                  showCardInfo: showCard,
                );
              },
            )
          : SizedBox(),
    );
  }

  Widget field(int col, int row, List<dynamic> board, List<dynamic> cardMatrix,
      Map<String, dynamic> option, Function drag, Function drop) {
    final Map<String, dynamic> field = board[col][row];

    return Expanded(
      child: Stack(
        children: [
          completeField(col, row, field, drop),
          cardStack(col, row, cardMatrix, drag, drop),
          MoveSet(col: col, row: row, option: option, moveSet: field['action']),
        ],
      ),
    );
  }

  Widget completeField(
      int col, int row, Map<String, dynamic> field, Function drop) {
    return DragTarget(
      onAccept: (dynamic card) => drop(col, row, card['card'], card['show']),
      builder: (context, candidateData, rejectedData) => virsualField(field),
    );
  }

  Widget virsualField(Map<String, dynamic> field) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RotatedBox(
        quarterTurns: field['field']['type'],
        child: Container(
          width: cardSize,
          height: cardSize,
          decoration: BoxDecoration(
            color: theme.appBarTheme.backgroundColor,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Center(
            child: Text(
              field['field']['name'],
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.iconTheme.color!.withOpacity(0.6),
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }

  Widget cardStack(int col, int row, List<dynamic> cardMatrix, Function drag,
      Function drop) {
    return cardMatrix[col][row].isEmpty
        ? SizedBox()
        : Stack(
            children: [
              for (var card in cardMatrix[col][row])
                Draggable(
                  key: UniqueKey(),
                  child: DragTarget(
                    onAccept: (dynamic card) =>
                        drop(col, row, card['card'], card['show']),
                    builder: (context, candidateData, rejectedData) => Padding(
                      padding: const EdgeInsets.all(4),
                      child: CARD(
                        card: card['card'],
                        saveEnable: false,
                        showCardImage: card['show'],
                        showCardInfo: card['show'],
                      ),
                    ),
                  ),
                  data: card,
                  feedback: SizedBox(
                    height: cardSize * 1.2,
                    child: CARD(
                      card: card['card'],
                      saveEnable: false,
                      showCardImage: card['show'],
                      showCardInfo: card['show'],
                    ),
                  ),
                  onDraggableCanceled: (velocity, offset) =>
                      drop(col, row, card['card'], false),
                  onDragEnd: (dragDetails) => drag(col, row),
                ),
            ],
          );
  }
}
