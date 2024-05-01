import 'package:flutter/material.dart';
import 'filter.dart';

class FilterBox extends StatefulWidget {
  final List<dynamic> _filter;

  const FilterBox({Key? key, required List<dynamic> filter})
      : _filter = filter,
        super(key: key);

  @override
  State<FilterBox> createState() => _FilterBoxState();
}

class _FilterBoxState extends State<FilterBox>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
    );
    _offsetAnimation = Tween<Offset>(
      begin: Offset(1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData _theme = Theme.of(context);

    return SlideTransition(
      position: _offsetAnimation,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Align(
          alignment: Alignment.topRight,
          child: Container(
            width: 260.0,
            decoration: BoxDecoration(
              color: _theme.appBarTheme.backgroundColor,
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Filter Options',
                      style: _theme.textTheme.titleSmall,
                    ),
                  ),
                  Filter(filter: widget._filter),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
