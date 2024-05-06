import 'package:flutter/material.dart';
import 'package:project/widget/board/moveSet.dart';
import 'package:project/widget/card/card.dart';

class FieldWidget {
  Widget field(
      {required int col,
      required int row,
      required List<dynamic> cardOnBoard}) {
    final Map<String, dynamic> field = board[col][row];

    return Expanded(
      child: Stack(
        children: [
          completeField(col: col, row: row, field: field),
          completeCard(col: col, row: row, cardOnBoard: cardOnBoard),
          MoveSet(col: col, row: row, option: option, field: field),
        ],
      ),
    );
  }

  Widget completeField(
      {required int col,
      required int row,
      required Map<String, dynamic> field}) {
    return DragTarget(
      onAccept: (dynamic card) => drop(col, row, card['card'], card['show']),
      builder: (context, candidateData, rejectedData) =>
          virsualField(field: field),
    );
  }

  Widget virsualField({required Map<String, dynamic> field}) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: RotatedBox(
        quarterTurns: field['field']['type'],
        child: Container(
          width: cardHeight,
          height: cardHeight,
          decoration: BoxDecoration(
            color: theme.appBarTheme.backgroundColor,
            borderRadius: BorderRadius.circular(8),
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

  Widget completeCard(
      {required int col,
      required int row,
      required List<dynamic> cardOnBoard}) {
    return cardOnBoard[col][row].isEmpty
        ? SizedBox()
        : Stack(
            children: [
              for (var card in cardOnBoard[col][row])
                virsualCard(col: col, row: row, card: card),
            ],
          );
  }

  Widget virsualCard(
      {required int col, required int row, required dynamic card}) {
    return Draggable(
      key: UniqueKey(),
      child: DragTarget(
        onAccept: (dynamic card) => drop(col, row, card['card'], card['show']),
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
        height: cardHeight * 1.2,
        child: CARD(
          card: card['card'],
          saveEnable: false,
          showCardImage: card['show'],
          showCardInfo: card['show'],
        ),
      ),
      onDraggableCanceled: (velocity, offset) =>
          drop(col, row, card['card'], card['show']),
      onDragEnd: (dragDetails) => drag(col, row),
    );
  }

  Widget handZone({required Map<String, dynamic> playerHand}) {
    final bool isMe = playerHand['type'] == 'me' ? true : false;
    final bool isSelect = playerHand['select'];

    return Positioned(
      left: 0,
      right: 0,
      top: isMe
          ? null
          : isSelect
              ? 0
              : -40,
      bottom: isMe
          ? isSelect
              ? 0
              : -40
          : null,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: RotatedBox(
            quarterTurns: isMe ? 0 : 2,
            child: hand(
                hand: playerHand['card'],
                player: playerHand['type'],
                isMe: isMe)),
      ),
    );
  }

  Widget hand(
      {required List<dynamic> hand,
      required String player,
      required bool isMe}) {
    return Container(
      height: cardHeight * 1.2,
      child: hand.isNotEmpty
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (hand.length > 4) ...[
                  Expanded(
                    child: ListView(
                        scrollDirection: Axis.horizontal,
                        reverse: !isMe,
                        children: [
                          for (var card in hand)
                            CARD(
                                card: card['card'],
                                saveEnable: false,
                                showCardImage: card['show'],
                                showCardInfo: card['show'],
                                player: player,
                                onCardClick: select),
                        ]),
                  )
                ] else ...[
                  for (var card in hand)
                    CARD(
                        card: card['card'],
                        saveEnable: false,
                        showCardImage: card['show'],
                        showCardInfo: card['show'],
                        player: player,
                        onCardClick: select),
                ]
              ],
            )
          : SizedBox(),
    );
  }

  final List<dynamic> board;
  final Map<String, dynamic> option;

  final Function drop;
  final Function drag;
  final Function place;
  final Function(String) select;

  final double cardHeight;

  late final ThemeData theme = Theme.of(context);
  final BuildContext context;

  FieldWidget(
      {required this.context,
      required this.board,
      required this.option,
      required this.drop,
      required this.drag,
      required this.place,
      required this.select,
      required this.cardHeight});
}
