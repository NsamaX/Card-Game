import 'package:flutter/material.dart';

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: widget.menuItem.length == 1
          ? Center(
              child:
                  Text(widget.menuItem[0], style: theme.textTheme.titleSmall))
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: widget.menuItem
                  .asMap()
                  .entries
                  .map((entry) => menu(entry.key, entry.value))
                  .toList()),
    );
  }

  Widget menu(int index, dynamic item) {
    final isTitle = index == (widget.menuItem.length ~/ 2);

    return GestureDetector(
      onTap: () {
        if (index < widget.onTapmenuItem.length)
          widget.onTapmenuItem[index]?.call();
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

  late final ThemeData theme = Theme.of(context);
}

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final List<dynamic> menuItem;
  final List<Function?> onTapmenuItem;

  const CustomAppBar(
      {Key? key, required this.menuItem, required this.onTapmenuItem})
      : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}
