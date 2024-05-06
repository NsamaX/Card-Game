import 'package:project/api/model/game/cfv.dart';
import 'package:project/api/model/model.dart';

class Factory {
  Model game({required String game}) {
    switch (game) {
      case 'cfv':
        return CFV();
      default:
        throw Exception('Unsupported game: $game');
    }
  }
}
