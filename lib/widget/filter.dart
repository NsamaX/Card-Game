import 'package:flutter/material.dart';
import 'theme.dart';

class filter extends StatefulWidget {
  final List<dynamic> _filter;

  const filter({Key? key, required List<dynamic> filter})
      : _filter = filter,
        super(key: key);

  @override
  State<filter> createState() => _filterState();
}

class _filterState extends State<filter> with SingleTickerProviderStateMixin {
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
          alignment: Alignment.centerRight,
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
                  for (var _option in widget._filter) _catagory(_option),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _catagory(List<dynamic> option) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
              top: BorderSide(
        color: themeData().iconTheme.color!.withOpacity(0.6),
      ))),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Column(
          children: [
            for (var _item in option) _filter(_item['icon'], _item['text'])
          ],
        ),
      ),
    );
  }

  Widget _filter(IconData? icon, String text) {
    return Row(
      children: [
        icon != null ? Icon(icon) : SizedBox(width: themeData().iconTheme.size),
        SizedBox(width: 8.0),
        Text(text, style: themeData().textTheme.bodyMedium),
      ],
    );
  }
}
