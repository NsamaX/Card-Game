import 'package:flutter/material.dart';
import 'theme.dart';

class actioN extends StatelessWidget {
  final Map<String, dynamic> _data;

  const actioN({Key? key, required Map<String, dynamic> data})
      : _data = data,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0.0,
      right: 0.0,
      child: Column(
        children: [
          for (var action in _data['action'])
            if (action.length > 0)
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: action is String
                    ? Text(
                        action,
                        style: themE().textTheme.bodySmall,
                      )
                    : Icon(action.keys.first),
              ),
        ],
      ),
    );
  }
}
