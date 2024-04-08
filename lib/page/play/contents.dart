import 'package:project/api/service/room.dart';

List<Map<String, dynamic>> roomsList =
    RoomGenerator(maxRoom: 260, maxRoomPerPage: 30, maxPageIcon: 6)
        .generateRoomsList();
