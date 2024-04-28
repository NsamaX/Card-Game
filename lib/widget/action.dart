import 'package:flutter/material.dart';
import 'theme.dart';

class actioN extends StatelessWidget {
  final int _col;
  final int _row;
  final Function _option;
  final List<dynamic> _onTap;

  const actioN(
      {Key? key,
      required int col,
      required int row,
      required Function option,
      required List<dynamic> onTap})
      : _col = col,
        _row = row,
        _option = option,
        _onTap = onTap,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _load = false;

    if (_onTap.length > 0)
      return Positioned(
        top: 0.0,
        right: 0.0,
        child: Column(
          children: [
            ..._onTap.map<Widget>((action) {
              if (action['action'] == 'load') _load = true;
              return _load && action['action'] != 'load'
                  ? SizedBox()
                  : _action(_option, action);
            }).toList(),
          ],
        ),
      );
    else
      return SizedBox();
  }

  Widget _action(Function _option, dynamic action) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: GestureDetector(
          onTap: action['action'] == 'load' ? () => _option(_col, _row) : null,
          child: action['icon'] is String
              ? Text(
                  action['icon'],
                  style: themE().textTheme.bodySmall,
                )
              : Icon(action['icon']),
        ));
  }
}
