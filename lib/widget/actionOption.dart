import 'package:flutter/material.dart';
import 'theme.dart';

class actionOption extends StatelessWidget {
  final int _col;
  final int _row;
  final Map<String, dynamic> _option;
  final List<dynamic> _onTap;

  const actionOption({
    Key? key,
    required int col,
    required int row,
    required Map<String, dynamic> option,
    required List<dynamic> onTap,
  })  : _col = col,
        _row = row,
        _option = option,
        _onTap = onTap,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    if (_onTap.isNotEmpty) {
      return Positioned(
        top: 0.0,
        right: 0.0,
        child: Container(
          width: themeData().iconTheme.size,
          height: 86.0,
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Column(
                children: [
                  for (var action in _onTap)
                    if (action['show']) _action(_option, action)
                ],
              ),
            ],
          ),
        ),
      );
    } else {
      return const SizedBox();
    }
  }

  Widget _action(Map<String, dynamic> _option, dynamic action) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: GestureDetector(
        onTap: () {
          switch (action['action']) {
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
            // case 'shuffle':
            //   return _option['shuffle'](20, _col, _row);
            // case 'stack':
            //   return _option['stack'](_col, _row);
            // case 'search':
            //   return _option['use'](_col, _row);
            default:
              break;
          }
        },
        child: action['show']
            ? action['icon'] is String
                ? Text(
                    action['icon'],
                    style: themeData().textTheme.bodySmall,
                  )
                : Icon(action['icon'])
            : SizedBox(),
      ),
    );
  }
}
