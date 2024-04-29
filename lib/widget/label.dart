import 'package:flutter/material.dart';
import 'theme.dart';

class labeL extends StatelessWidget {
  final List<dynamic> _label;

  const labeL({Key? key, required List<dynamic> label})
      : _label = label,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ..._label.map<Widget>((category) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (category['title'] != null) _title(category['title']),
              ...category['content'].map<Widget>((item) {
                return _content(
                  context,
                  item['icon'],
                  item['text'],
                  item['page'],
                );
              }).toList(),
            ],
          );
        }).toList(),
      ],
    );
  }

  Widget _title(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, top: 16.0, bottom: 8.0),
      child: Text(
        text,
        style: themeData()
            .textTheme
            .bodyMedium
            ?.copyWith(color: themeData().secondaryHeaderColor),
      ),
    );
  }

  Widget _content(
      BuildContext context, IconData? icon, String text, Widget? page) {
    return GestureDetector(
      onTap: () {
        if (page != null) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        }
      },
      child: Container(
        height: 40.0,
        decoration: BoxDecoration(
          color: themeData().primaryColor,
          border: Border(
            bottom: BorderSide(
              color: themeData().iconTheme.color!.withOpacity(0.6),
              width: 1.0,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Row(
            children: [
              icon != null
                  ? Icon(icon)
                  : SizedBox(width: themeData().iconTheme.size),
              SizedBox(width: 20.0),
              Text(text, style: themeData().textTheme.bodySmall),
            ],
          ),
        ),
      ),
    );
  }
}
