import 'package:flutter/material.dart';
import 'theme.dart';

class actionItem extends StatelessWidget {
  final int _col;
  final int _row;
  final Map<String, dynamic> _option;
  final dynamic _action;

  const actionItem({
    Key? key,
    required int col,
    required int row,
    required Map<String, dynamic> option,
    required dynamic action,
  })  : _col = col,
        _row = row,
        _option = option,
        _action = action,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: GestureDetector(
        onTap: () {
          switch (_action['action']) {
            // case 'bin':
            //   return _option['bin'](_col, _row);
            // case 'block':
            //   return _option['block'](_col, _row);
            // case 'damage':
            //   return _option['damage'](_col, _row);
            // case 'draw':
            //   return _option['draw'](_col, _row);
            case 'flip':
              return _option['flip'](_col, _row);
            // case 'guard':
            //   return _option['guard'](_col, _row);
            case 'load':
              return _option['load'](_col, _row);
            // case 'rotateX':
            //   return _option['rotateX'](_col, _row);
            // case 'rotateY':
            //   return _option['rotateY'](_col, _row);
            // case 'search':
            //   return _option['search'](_col, _row);
            case 'shuffle':
              return _option['shuffle'](20, _col, _row);
            // case 'stack':
            //   return _option['stack'](_col, _row);
            // case 'search':
            //   return _option['use'](_col, _row);
            case 'special' ||
                  'tigger' ||
                  'guard' ||
                  'show' ||
                  'bind' ||
                  'damage' ||
                  'drop':
              return _option['use'](_col, _row, _action['action']);
            default:
              break;
          }
        },
        child: _action['icon'] is String
            ? Text(
                _action['icon'],
                style: themeData().textTheme.bodySmall,
              )
            : Icon(_action['icon']),
      ),
    );
  }
}
