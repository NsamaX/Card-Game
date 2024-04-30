import 'package:flutter/material.dart';
import 'actionItem.dart';
import 'theme.dart';

class action extends StatelessWidget {
  final int _col;
  final int _row;
  final Map<String, dynamic> _option;
  final List<dynamic> _onTap;

  const action({
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
                    if (action['show'])
                      actionItem(
                        col: _col,
                        row: _row,
                        option: _option,
                        action: action,
                      )
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
}
