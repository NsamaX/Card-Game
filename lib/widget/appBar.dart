import 'package:flutter/material.dart';

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: widget.menu.length == 1
          ? Center(
              child: Text(widget.menu.keys.first,
                  style: theme.textTheme.titleSmall))
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: widget.menu.entries
                  .map((entry) => menu(entry.key, entry.value))
                  .toList(),
            ),
    );
  }

  Widget menu(dynamic menu, dynamic onTapFunction) {
    final isTitle =
        menu == (widget.menu.keys.toList()[(widget.menu.length ~/ 2)]);

    return GestureDetector(
      onTap: () {
        onTapFunction?.call();
      },
      child: menu != null
          ? menu is String
              ? Text('$menu',
                  style: isTitle ? theme.textTheme.titleSmall : null)
              : Icon(menu)
          : SizedBox(width: 34),
    );
  }

  late final ThemeData theme = Theme.of(context);
}

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final Map<dynamic, dynamic> menu;

  const CustomAppBar({Key? key, required this.menu}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}
