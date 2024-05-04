import 'package:flutter/material.dart';

class Label extends StatelessWidget {
  final List<dynamic> label;

  const Label({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...label.map<Widget>((category) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (category['title'] != null) title(theme, category['title']),
              ...category['content'].map<Widget>((item) {
                return content(
                    theme, context, item['icon'], item['text'], item['page']);
              }).toList(),
            ],
          );
        }).toList(),
      ],
    );
  }

  Widget title(ThemeData theme, String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 16, bottom: 8),
      child: Text(
        text,
        style: theme.textTheme.bodyMedium
            ?.copyWith(color: theme.secondaryHeaderColor),
      ),
    );
  }

  Widget content(ThemeData theme, BuildContext context, IconData icon,
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
        height: 40,
        decoration: BoxDecoration(
          color: theme.primaryColor,
          border: Border(
            bottom: BorderSide(
                color: theme.iconTheme.color!.withOpacity(0.6), width: 1),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Row(
            children: [
              Icon(icon),
              SizedBox(width: 20),
              Text(text, style: theme.textTheme.bodySmall),
            ],
          ),
        ),
      ),
    );
  }
}
