import 'package:flutter/material.dart';
import 'package:project/theme_color.dart';

class Label extends StatelessWidget {
  final List<dynamic> contents;

  const Label({Key? key, required this.contents}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...contents.map<Widget>((category) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (category['topic'] != null) ...[
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 16.0),
                  child: Text(
                    category['topic'],
                    style: TextStyle(color: subColor, fontSize: 16.0),
                  ),
                ),
                SizedBox(height: 8.0),
              ],
              ...category['label'].map<Widget>((item) {
                return buildLabel(
                  context,
                  item['icon'],
                  item['topic'],
                  item['page'],
                  item['isImportant'] ?? false,
                );
              }).toList(),
            ],
          );
        }).toList(),
      ],
    );
  }

  Widget buildLabel(BuildContext context, IconData icon, String text,
      Widget? page, bool isImportant) {
    Color labelColor = isImportant ? goldColor : Colors.white;
    TextStyle labelTextStyle =
        TextStyle(color: labelColor, fontSize: isImportant ? 16.0 : 12.0);

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
          color: mainColor4,
          border: Border(
            bottom: BorderSide(
              color: Colors.white.withOpacity(0.5),
              width: 1.0,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Row(
            children: [
              Icon(icon, color: labelColor, size: isImportant ? 20.0 : 16.0),
              SizedBox(width: 20.0),
              Text(
                text,
                style: labelTextStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
