import 'package:flutter/material.dart';
import 'page_nav/page_bar.dart';
import 'label.dart';

class Room extends StatefulWidget {
  final List<dynamic> rooms;
  final int maxRoomPerPage;
  final int maxPageIcon;

  Room({
    Key? key,
    required this.rooms,
    required this.maxRoomPerPage,
    required this.maxPageIcon,
  }) : super(key: key);

  @override
  _RoomState createState() => _RoomState();
}

class _RoomState extends State<Room> {
  var currentPage = 0;

  @override
  Widget build(BuildContext context) {
    int startRoom = currentPage * widget.maxRoomPerPage;
    int endRoom = (currentPage + 1) * widget.maxRoomPerPage;
    if (endRoom > widget.rooms.length) endRoom = widget.rooms.length;

    return Expanded(
      child: Column(
        children: [
          Label(contents: widget.rooms.sublist(startRoom, endRoom)),
          PageBar(
            currentPage: currentPage,
            totalPages: (widget.rooms.length / widget.maxRoomPerPage).ceil(),
            maxPageIcon: widget.maxPageIcon,
            onOperatorTap: (String operator) {
              setState(() {
                if (operator == '+') {
                  currentPage += 1;
                } else {
                  if (currentPage > 0) currentPage -= 1;
                }
              });
            },
            onPageTap: (int page) {
              setState(() {
                currentPage = page;
              });
            },
          ),
        ],
      ),
    );
  }
}
