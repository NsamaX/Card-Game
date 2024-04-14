import 'package:flutter/material.dart';

class appBar extends StatelessWidget implements PreferredSizeWidget {
  final BuildContext _context;
  final int _title;
  final List<dynamic> _menus;
  final List<Function> _onTap;

  appBar({
    Key? key,
    required BuildContext context,
    required List<dynamic> menus,
    required List<Function> onTap,
  })  : _context = context,
        _title = (menus.length / 2).round() - 1,
        _menus = menus,
        _onTap = onTap,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: _menus.asMap().entries.map((entry) {
          return _icon(entry.key, entry.value);
        }).toList(),
      ),
    );
  }

  Widget _icon(int index, dynamic menu) {
    final isTitle = index == _title;

    return GestureDetector(
      onTap: () {
        if (index < _onTap.length) {
          _onTap[index].call();
        }
      },
      child: _selector(menu, isTitle),
    );
  }

  Widget _selector(dynamic menu, bool isTitle) {
    return (menu is String)
        ? Text(
            '$menu',
            style: TextStyle(
              color: isTitle
                  ? Colors.white
                  : Theme.of(_context).textTheme.bodyText1?.color,
              fontWeight: FontWeight.bold,
              fontSize: isTitle ? 20.0 : 16.0,
            ),
          )
        : (menu is IconData)
            ? Icon(
                menu,
                color: Colors.blue,
              )
            : SizedBox(
                width: 30.0,
              );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
