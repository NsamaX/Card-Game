import 'package:flutter/material.dart';
import 'theme.dart';

class filteR extends StatelessWidget {
  final List<dynamic> _filter;

  const filteR({Key? key, required List<dynamic> filter})
      : _filter = filter,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                for (var _data in _filter) _catagory(_data),
              ],
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
      child: Column(
        children: [for (var item in data) _label(item['icon'], item['text'])],
      ),
    );
  }

  Widget _label(IconData icon, String text) {
    return Row(children: [
      Icon(icon),
      SizedBox(width: 8.0),
      Text(text, style: themE().textTheme.bodyMedium),
    ]);
  }
}
