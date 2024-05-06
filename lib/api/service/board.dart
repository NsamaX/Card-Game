// TODO: set board all format

import 'package:project/api/service/board/cfv/g.dart';
import 'package:project/api/service/board/format.dart';

class BoardService {
  final List<dynamic> field;
  final List<dynamic> action;
  final Map<String, dynamic> event;

  BoardService({required String game, required String format})
      : field = BoardService.createFormat(game, format).getField(),
        action = BoardService.createFormat(game, format).getAction(),
        event = BoardService.createFormat(game, format).getEvent();

  static Format createFormat(String game, String format) {
    switch (game) {
      case 'cfv':
        switch (format) {
          case 'G':
            return G();
          default:
            throw ArgumentError('Unsupported format: $format');
        }
      default:
        throw ArgumentError('Unsupported game: $game');
    }
  }

  List<dynamic> cloneFieldWithoutAction() {
    List<dynamic> cloneField = [];
    for (int col = field.length - 1; col >= 0; col--) {
      List<dynamic> column = [];
      for (int row = field[col].length - 1; row >= 0; row--) {
        Map<String, dynamic> data = {
          'field': {
            'name': field[col][row]['field']['name'],
            'event': field[col][row]['field']['event'] ?? 'none',
            'type': (() {
              switch (field[col][row]['field']['type']) {
                case 0:
                  return 2;
                case 1:
                  return 3;
                case 2:
                  return 0;
                case 3:
                  return 1;
                default:
                  return -1;
              }
            })(),
          },
          'action': [],
        };
        column.add(data);
      }
      cloneField.add(column);
    }
    return cloneField;
  }

  List<dynamic> setFieldAction() {
    List<dynamic> fieldset = field;
    for (int col = 0; col < fieldset.length; col++)
      for (int row = 0; row < fieldset[col].length; row++) {
        List<dynamic> data = [];
        for (int i = 0; i < fieldset[col][row]['action'].length; i++)
          for (var move in action)
            if (fieldset[col][row]['action'][i] == move['action']) {
              Map<String, dynamic> actionCopy = {
                'action': move['action'],
                'icon': move['icon'],
                'show': move['action'] == 'load' ? true : false,
              };
              data.add(actionCopy);
            }
        fieldset[col][row]['action'] = data;
      }
    return fieldset;
  }

  List<dynamic> getField() {
    List<dynamic> board = cloneFieldWithoutAction();
    board.addAll(setFieldAction());
    return board;
  }

  Map<String, dynamic> getEvent() => event;
}
