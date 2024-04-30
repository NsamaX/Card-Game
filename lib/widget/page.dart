import 'package:flutter/material.dart';
import 'theme.dart';

class page extends StatelessWidget {
  final int _currentPage;
  final int _page;
  final int _icon;
  final Function(int) _onTap;
  final double _size = 30.0;

  const page({
    Key? key,
    required int currentPage,
    required int page,
    required int icon,
    required Function(int) onTap,
  })  : _currentPage = currentPage,
        _page = page,
        _icon = icon,
        _onTap = onTap,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    int _start = _currentPage ~/ _icon * _icon;
    int _end = _start + _icon;
    if (_end > _page) _end = _page;
    if (_start - _end < _icon) _start = _end - _icon;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (_currentPage >= _icon)
          _item(_onTap, _currentPage - 1, Icons.arrow_back_ios_rounded),
        for (int page = _start; page < _end; page++) _item(_onTap, page, null),
        if (_end < _page)
          _item(_onTap, _currentPage + 1, Icons.arrow_forward_ios_rounded),
      ],
    );
  }

  Widget _item(Function(int) onTap, int page, IconData? icon) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          onTap(page);
        },
        child: Container(
          width: _size,
          height: _size,
          decoration: BoxDecoration(
            color: page == _currentPage
                ? themeData().secondaryHeaderColor
                : themeData().primaryColor,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: icon == null
                ? Text(
                    (page + 1).toString(),
                    style: themeData()
                        .textTheme
                        .bodyMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                  )
                : Icon(icon),
          ),
        ),
      ),
    );
  }
}
