import 'package:flutter/material.dart';
import 'theme.dart';

class filteR extends StatefulWidget {
  final List<dynamic> _filter;

  const filteR({Key? key, required List<dynamic> filter})
      : _filter = filter,
        super(key: key);

  @override
  State<filteR> createState() => _filteRState();
}

class _filteRState extends State<filteR> with SingleTickerProviderStateMixin {
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
        padding: const EdgeInsets.only(top: 16.0),
        child: Align(
          alignment: Alignment.centerRight,
          child: Container(
            width: 260.0,
            height: double.infinity,
            decoration: BoxDecoration(
              color: themE().appBarTheme.backgroundColor,
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
                      style: themE().textTheme.titleSmall,
                    ),
                  ),
                  for (var _data in widget._filter) _catagory(_data),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _catagory(List<dynamic> data) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
              top: BorderSide(
        color: themE().primaryColorLight.withOpacity(0.6),
      ))),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Column(
          children: [for (var item in data) _label(item['icon'], item['text'])],
        ),
      ),
    );
  }

  Widget _label(IconData? icon, String text) {
    return Row(children: [
      icon != null ? Icon(icon) : SizedBox(width: themE().iconTheme.size),
      SizedBox(width: 8.0),
      Text(text, style: themE().textTheme.bodyMedium),
    ]);
  }
}
