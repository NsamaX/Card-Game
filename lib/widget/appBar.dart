import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<dynamic> _menu;
  final List<Function> _onTap;

  const CustomAppBar(
      {Key? key, required List<dynamic> menu, required List<Function> onTap})
      : _menu = menu,
        _onTap = onTap,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData _theme = Theme.of(context);

    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: _menu
            .asMap()
            .entries
            .map((entry) => _item(_theme, context, entry.key, entry.value))
            .toList(),
      ),
    );
  }

  Widget _item(ThemeData theme, BuildContext context, int index, dynamic item) {
    final _isTitle = index == (_menu.length ~/ 2);

    return GestureDetector(
      onTap: () {
        if (index < _onTap.length) {
          _onTap[index].call();
        }
      },
      child: item != null
          ? item is String
              ? Text(
                  '$item',
                  style: _isTitle ? theme.textTheme.titleSmall : TextStyle(),
                )
              : Container(
                  child: Icon(item),
                )
          : SizedBox(width: 34.0),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
