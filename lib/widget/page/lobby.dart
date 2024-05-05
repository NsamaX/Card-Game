// TODO: create create room widget

import 'package:flutter/material.dart';
import 'package:project/widget/label.dart';

class LobbyWidget {
  Widget room(List<dynamic> allRoom, int maxRoomPerPage, int currentPage) {
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
      int currentPage,
      int totalRoom,
      int maxRoomPerPage,
      int maxNavigationTap,
      double navigationTapSize,
      Function(int) changePage) {
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
          navigationTap(currentPage, currentPage - 1, navigationTapSize,
              Icons.arrow_back_ios_rounded, changePage),
        for (int page = startIndex; page < endIndex; page++)
          navigationTap(currentPage, page, navigationTapSize, null, changePage),
        if (endIndex < currentRoom)
          navigationTap(currentPage, currentPage + 1, navigationTapSize,
              Icons.arrow_forward_ios_rounded, changePage),
      ],
    );
  }

  Widget navigationTap(int currentPage, int page, double navigationTapSize,
      IconData? icon, Function(int) onTap) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: GestureDetector(
        onTap: () {
          onTap(page);
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
