import 'package:flutter/material.dart';
import 'theme.dart';

class filter extends StatelessWidget {
  final List<dynamic> _filter;

  const filter({Key? key, required List<dynamic> filter})
      : _filter = filter,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: _filter.map((entry) => _catagory(entry)).toList(),
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
          children: option
              .map((entry) => _option(entry['icon'], entry['text']))
              .toList(),
        ),
      ),
    );
  }

  Widget _option(IconData? icon, String text) {
    return Row(
      children: [
        icon != null ? Icon(icon) : SizedBox(width: themeData().iconTheme.size),
        SizedBox(width: 8.0),
        Text(text, style: themeData().textTheme.bodyMedium),
      ],
    );
  }
}
