import 'package:flutter/material.dart';
import 'theme.dart';

class actioN extends StatefulWidget {
  final Map<dynamic, Function()> _action;

  const actioN({
    Key? key,
    required Map<dynamic, Function()> action,
  })  : _action = action,
        super(key: key);

  @override
  State<actioN> createState() => _actioNState();
}

class _actioNState extends State<actioN> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0.0,
      right: 0.0,
      child: Column(children: [
        for (dynamic item in widget._action.keys)
          _action(item: item, onPressed: () => widget._action[item]!()),
      ]),
    );
  }

  Widget _action({required dynamic item, required Function()? onPressed}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          width: 22.0,
          decoration: BoxDecoration(
            color: themE().primaryColorLight,
            shape: BoxShape.circle,
          ),
          child: item is int
              ? Text(
                  item.toString(),
                  style: themE().textTheme.bodyMedium?.copyWith(
                        color: themE().primaryColorDark,
                        fontWeight: FontWeight.bold,
                      ),
                  textAlign: TextAlign.center,
                )
              : Icon(
                  item,
                  color: themE().primaryColorDark,
                  size: 22.0,
                ),
        ),
      ),
    );
  }
}
