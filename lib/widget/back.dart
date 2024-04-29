import 'package:flutter/material.dart';
import 'theme.dart';

class back extends StatelessWidget implements PreferredSizeWidget {
  final String _title;
  final dynamic _icon;
  final Function() _onTap;

  const back({
    Key? key,
    String? title,
    required dynamic icon,
    required Function() onTap,
  })  : _title = title ?? '',
        _icon = icon,
        _onTap = onTap,
        super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Center(
        child: Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Text(_title, style: themeData().textTheme.titleSmall),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 22.0),
          child: GestureDetector(
            onTap: _onTap,
            child: _icon is String ? Text(_icon) : Icon(_icon),
          ),
        ),
      ],
    );
  }
}
