import 'package:flutter/material.dart';
import 'theme.dart';

class action extends StatelessWidget {
  final Map<String, dynamic> _action;
  final List<dynamic> _onTap;
  final int _col;
  final int _row;

  const action({
    Key? key,
    required Map<String, dynamic> action,
    required List<dynamic> onTap,
    required int col,
    required int row,
  })  : _action = action,
        _onTap = onTap,
        _col = col,
        _row = row,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    if (_onTap.length > 0)
      return Positioned(
        top: 0.0,
        right: 0.0,
        child: Column(
          children: [
            ..._onTap.map<Widget>((action) {
              return _option(_action, action);
            }).toList(),
          ],
        ),
      );
    else
      return SizedBox();
  }

  Widget _option(Map<String, dynamic> _action, dynamic action) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: GestureDetector(
        onTap: () {
          switch (action['action']) {
            case 'load':
              _action['load'](_col, _row);
              break;
            case 'flip':
              _action['flip'](_col, _row);
            default:
              break;
          }
        },
        child: action['icon'] is String
            ? Text(
                action['icon'],
                style: themeData().textTheme.bodySmall,
              )
            : Icon(action['icon']),
      ),
    );
  }
}
