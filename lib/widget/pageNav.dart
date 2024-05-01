import 'package:flutter/material.dart';

class PageNavigation extends StatelessWidget {
  final double _navigationTapSize = 30.0;

  final int _currentPage;
  final int _maxRoomPerPage;
  final int _maxNavigationTap;
  final Function(int) _onTap;

  const PageNavigation(
      {Key? key,
      required int currentPage,
      required int maxRoomPerPage,
      required int maxNavigationTap,
      required Function(int) onTap})
      : _currentPage = currentPage,
        _maxRoomPerPage = maxRoomPerPage,
        _maxNavigationTap = maxNavigationTap,
        _onTap = onTap,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData _theme = Theme.of(context);

    int _startIndex = (_currentPage ~/ _maxNavigationTap) * _maxNavigationTap;
    int _endIndex = _startIndex + _maxNavigationTap;

    if (_endIndex > _maxRoomPerPage) _endIndex = _maxRoomPerPage;
    if (_startIndex - _endIndex < _maxNavigationTap)
      _startIndex = _endIndex - _maxNavigationTap;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (_currentPage >= _maxNavigationTap)
          _navigationTap(
              _theme, _onTap, _currentPage - 1, Icons.arrow_back_ios_rounded),
        for (int page = _startIndex; page < _endIndex; page++)
          _navigationTap(_theme, _onTap, page, null),
        if (_endIndex < _maxRoomPerPage)
          _navigationTap(_theme, _onTap, _currentPage + 1,
              Icons.arrow_forward_ios_rounded),
      ],
    );
  }

  Widget _navigationTap(
      ThemeData theme, Function(int) onTap, int page, IconData? icon) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          onTap(page);
        },
        child: Container(
          width: _navigationTapSize,
          height: _navigationTapSize,
          decoration: BoxDecoration(
            color: page == _currentPage
                ? theme.secondaryHeaderColor
                : theme.primaryColor,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: icon == null
                ? Text(
                    (page + 1).toString(),
                    style: theme.textTheme.bodyMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                  )
                : Icon(icon),
          ),
        ),
      ),
    );
  }
}
