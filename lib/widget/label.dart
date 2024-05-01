import 'package:flutter/material.dart';

class Label extends StatelessWidget {
  final List<dynamic> _label;

  const Label({Key? key, required List<dynamic> label})
      : _label = label,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData _theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ..._label.map<Widget>((category) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (category['title'] != null) _title(_theme, category['title']),
              ...category['content'].map<Widget>((item) {
                return _content(
                    _theme, context, item['icon'], item['text'], item['page']);
              }).toList(),
            ],
          );
        }).toList(),
      ],
    );
  }

  Widget _title(ThemeData theme, String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, top: 16.0, bottom: 8.0),
      child: Text(
        text,
        style: theme.textTheme.bodyMedium?.copyWith(
          color: theme.secondaryHeaderColor,
        ),
      ),
    );
  }

  Widget _content(ThemeData theme, BuildContext context, IconData icon,
      String text, Widget? page) {
    return GestureDetector(
      onTap: () {
        if (page != null)
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
      },
      child: Container(
        height: 40.0,
        decoration: BoxDecoration(
          color: theme.primaryColor,
          border: Border(
            bottom: BorderSide(
              color: theme.iconTheme.color!.withOpacity(0.6),
              width: 1.0,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Row(
            children: [
              Icon(icon),
              SizedBox(width: 20.0),
              Text(text, style: theme.textTheme.bodySmall),
            ],
          ),
        ),
      ),
    );
  }
}
