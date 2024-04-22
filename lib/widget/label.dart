import 'package:flutter/material.dart';
import 'package:project/widget/theme/color.dart';

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
              if (category['title'] != null) ...[
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 16.0),
                  child: Text(
                    category['title'],
                    style: TextStyle(color: subColor, fontSize: 16.0),
                  ),
                ),
                SizedBox(height: 8.0),
              ],
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

  Widget _content(
      BuildContext context, IconData icon, String text, Widget? page) {
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
              Icon(icon, color: Colors.white, size: 16.0),
              SizedBox(width: 20.0),
              Text(
                text,
                style: TextStyle(color: Colors.white, fontSize: 12.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
