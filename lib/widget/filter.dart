import 'package:flutter/material.dart';

class Filter extends StatelessWidget {
  final List<dynamic> _filter;

  const Filter({Key? key, required List<dynamic> filter})
      : _filter = filter,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData _theme = Theme.of(context);

    return Column(
      children: _filter.map((entry) => _category(_theme, entry)).toList(),
    );
  }

  Widget _category(ThemeData theme, List<dynamic> options) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: theme.iconTheme.color!.withOpacity(0.6),
          ),
        ),
      ),
      child: Column(
        children: options
            .map((entry) => _option(theme, entry['icon'], entry['text']))
            .toList(),
      ),
    );
  }

  Widget _option(ThemeData theme, IconData? icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          icon != null ? Icon(icon) : SizedBox(width: theme.iconTheme.size),
          SizedBox(width: 8.0),
          Text(text, style: theme.textTheme.bodyMedium),
        ],
      ),
    );
  }
}
