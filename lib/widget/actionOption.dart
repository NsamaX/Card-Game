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
                children: _onTap.map<Widget>((action) {
                  return _action(_option, action);
                }).toList(),
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
            case 'load':
              _option['load'](_col, _row);
              break;
            case 'flip':
              _option['flip'](_col, _row);
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
