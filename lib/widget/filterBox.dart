import 'package:flutter/material.dart';
import 'filter.dart';
import 'theme.dart';

class filterBox extends StatefulWidget {
  final List<dynamic> _filter;

  const filterBox({Key? key, required List<dynamic> filter})
      : _filter = filter,
        super(key: key);

  @override
  State<filterBox> createState() => _filterState();
}

class _filterState extends State<filterBox>
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
    return SlideTransition(
      position: _offsetAnimation,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Align(
          alignment: Alignment.topRight,
          child: Container(
            width: 260.0,
            decoration: BoxDecoration(
              color: themeData().appBarTheme.backgroundColor,
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
                      style: themeData().textTheme.titleSmall,
                    ),
                  ),
                  filter(filter: widget._filter),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
