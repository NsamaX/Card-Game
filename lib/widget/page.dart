import 'package:flutter/material.dart';
import 'color.dart';

class pagE extends StatelessWidget {
  final int _currentPage;
  final int _page;
  final int _icon;
  final Function(int) _onTap;

  const pagE({
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
    if (_start - _end < _icon) {
      _start = _end - _icon;
    }

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
          height: 30.0,
          width: 30.0,
          decoration: BoxDecoration(
            color: page == _currentPage ? secondary : primary4,
            shape: BoxShape.circle,
          ),
          child: Center(
              child: icon == null
                  ? Text(
                      (page + 1).toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : Icon(
                      icon,
                      color: Colors.white,
                      size: 12.0,
                    )),
        ),
      ),
    );
  }
}
