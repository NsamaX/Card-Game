import 'package:project/api/service/room.dart';

class contenT {
  final List<dynamic> _room = rooM(room: 260).generate();
  final int _page = 30;
  final int _icon = 6;

  List<dynamic> getRoom() => _room;

  int getPage() => _page;

  int getIcon() => _icon;
}
