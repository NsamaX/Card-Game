import 'package:flutter/material.dart';

class _LabelState extends State<Label> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...widget.label.map<Widget>((category) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (category['title'] != null) title(text: category['title']),
              ...category['content'].map<Widget>((item) {
                return content(
                    icon: item['icon'], text: item['text'], page: item['page']);
              }).toList(),
            ],
          );
        }).toList(),
      ],
    );
  }

  Widget title({required String text}) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 16, bottom: 8),
      child: Text(
        text,
        style: theme.textTheme.bodyMedium
            ?.copyWith(color: theme.secondaryHeaderColor),
      ),
    );
  }

  Widget content({required IconData icon, required String text, Widget? page}) {
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

  late final ThemeData theme = Theme.of(context);
}

class Label extends StatefulWidget {
  final List<dynamic> label;

  const Label({Key? key, required this.label}) : super(key: key);

  @override
  State<Label> createState() => _LabelState();
}
