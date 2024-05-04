import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<dynamic> menuItem;
  final List<Function?> onTapmenuItem;

  const CustomAppBar(
      {Key? key, required this.menuItem, required this.onTapmenuItem})
      : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return AppBar(
      title: menuItem.length == 1
          ? Center(child: Text(menuItem[0], style: theme.textTheme.titleSmall))
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: menuItem
                  .asMap()
                  .entries
                  .map((entry) => menu(theme, context, entry.key, entry.value))
                  .toList()),
    );
  }

  Widget menu(ThemeData theme, BuildContext context, int index, dynamic item) {
    final isTitle = index == (menuItem.length ~/ 2);

    return GestureDetector(
      onTap: () {
        if (index < onTapmenuItem.length) onTapmenuItem[index]?.call();
      },
      child: item != null
          ? item is String
              ? Text(
                  '$item',
                  style: isTitle ? theme.textTheme.titleSmall : TextStyle(),
                )
              : Icon(item)
          : SizedBox(width: 34),
    );
  }
}
