import 'package:flutter/material.dart';
import 'theme.dart';

class actioN extends StatelessWidget {
  final List<dynamic> _onTap;

  const actioN({Key? key, required List<dynamic> onTap})
      : _onTap = onTap,
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
                  : _action(action);
            }).toList(),
          ],
        ),
      );
    else
      return SizedBox();
  }

  Widget _action(dynamic action) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: action['icon'] is String
          ? Text(
              action['icon'],
              style: themE().textTheme.bodySmall,
            )
          : Icon(action['icon']),
    );
  }
}
