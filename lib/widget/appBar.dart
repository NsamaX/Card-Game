import 'package:flutter/material.dart';

class apPbaR extends StatelessWidget implements PreferredSizeWidget {
  final List<dynamic> _menu;
  final List<Function> _onTap;

  apPbaR({
    Key? key,
    required List<dynamic> menu,
    required List<Function> onTap,
  })  : _menu = menu,
        _onTap = onTap,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: _menu
            .asMap()
            .entries
            .map((entry) => _build_MenuItem(context, entry.key, entry.value))
            .toList(),
      ),
    );
  }

  Widget _build_MenuItem(BuildContext context, int index, dynamic item) {
    final _isTitle = index == (_menu.length ~/ 2);

    return GestureDetector(
      onTap: () {
        if (index < _onTap.length) {
          _onTap[index].call();
        }
      },
      child: item is String
          ? Text(
              '$item',
              style: _isTitle
                  ? TextStyle(color: Colors.white, fontSize: 20.0)
                  : TextStyle(),
            )
          : item is IconData
              ? Icon(item)
              : SizedBox(
                  width: 30.0,
                ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}