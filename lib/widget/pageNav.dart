import 'package:flutter/material.dart';
import 'package:project/theme/color.dart';

class PageBar extends StatelessWidget {
  final int _currentPage;
  final int _page;
  final int _icon;
  final Function(int page) _onTap;

  const PageBar({
    Key? key,
    required int currentPage,
    required int page,
    required int icon,
    required Function(int page) onTap,
  })  : _currentPage = currentPage,
        _page = page,
        _icon = icon,
        _onTap = onTap,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    int start = _currentPage ~/ _icon * _icon;
    int end = start + _icon;

    if (end > _page) end = _page;
    if (start - end < _icon) {
      start = end - _icon;
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (_currentPage >= _icon) operator(_onTap, true, _currentPage - 1),
        for (int page = start; page < end; page++) operator(_onTap, null, page),
        if (end < _page) operator(_onTap, false, _currentPage + 1),
      ],
    );
  }

  Widget operator(Function _onTap, bool? _prev, int _page) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          _onTap(_page);
        },
        child: Container(
          height: 30.0,
          width: 30.0,
          decoration: BoxDecoration(
            color: _page == _currentPage ? subColor : mainColor4,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: (_prev != null)
                ? Icon(
                    (_prev)
                        ? Icons.arrow_back_ios_rounded
                        : Icons.arrow_forward_ios_rounded,
                    color: Colors.white,
                    size: 12.0,
                  )
                : Text(
                    (_page + 1).toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
