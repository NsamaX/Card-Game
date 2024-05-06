// TODO: create create room widget

import 'package:flutter/material.dart';
import 'package:project/widget/label.dart';

class LobbyWidget {
  Widget room(
      {required List<dynamic> allRoom,
      required int maxRoomPerPage,
      required int currentPage}) {
    final int startIndex = currentPage * maxRoomPerPage;
    final int endIndex = (currentPage + 1) * maxRoomPerPage;
    final int totalRoom = allRoom.length;

    final List<dynamic> currentRoom = allRoom.sublist(
      startIndex,
      endIndex.clamp(0, totalRoom),
    );

    return Label(label: currentRoom);
  }

  Widget pageNavigation(
      {required int currentPage,
      required int totalRoom,
      required int maxRoomPerPage,
      required int maxNavigationTap,
      required double navigationTapSize,
      required Function(int) changePage}) {
    int currentRoom = (totalRoom / maxRoomPerPage).ceil();

    int startIndex = (currentPage ~/ maxNavigationTap) * maxNavigationTap;
    int endIndex = startIndex + maxNavigationTap;

    if (endIndex > currentRoom) endIndex = currentRoom;
    if (startIndex - endIndex < maxNavigationTap)
      startIndex = endIndex - maxNavigationTap;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (currentPage >= maxNavigationTap)
          navigationTap(
              currentPage: currentPage,
              page: currentPage - 1,
              navigationTapSize: navigationTapSize,
              icon: Icons.arrow_back_ios_rounded,
              changePage: changePage),
        for (int page = startIndex; page < endIndex; page++)
          navigationTap(
              currentPage: currentPage,
              page: page,
              navigationTapSize: navigationTapSize,
              icon: null,
              changePage: changePage),
        if (endIndex < currentRoom)
          navigationTap(
              currentPage: currentPage,
              page: currentPage + 1,
              navigationTapSize: navigationTapSize,
              icon: Icons.arrow_forward_ios_rounded,
              changePage: changePage),
      ],
    );
  }

  Widget navigationTap(
      {required int currentPage,
      required int page,
      required double navigationTapSize,
      required IconData? icon,
      required Function(int) changePage}) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: GestureDetector(
        onTap: () {
          changePage(page);
        },
        child: Container(
          width: navigationTapSize,
          height: navigationTapSize,
          decoration: BoxDecoration(
            color: page == currentPage
                ? theme.secondaryHeaderColor
                : theme.primaryColor,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: icon == null
                ? Text(
                    (page + 1).toString(),
                    style: theme.textTheme.bodyMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                  )
                : Icon(icon),
          ),
        ),
      ),
    );
  }

  final BuildContext context;
  late final ThemeData theme = Theme.of(context);

  LobbyWidget({required this.context});
}
