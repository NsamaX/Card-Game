import 'package:flutter/material.dart';
import 'package:project/api/cfv.dart';

class InfoWidget {
  Widget saveButton(bool saveEnable, Function() saveCard) {
    return Padding(
      padding: const EdgeInsets.only(right: 22),
      child: GestureDetector(
          onTap: saveCard, child: Text(saveEnable ? 'Save' : '')),
    );
  }

  Widget image(Model card) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Center(
        child: Container(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              card.getImage(),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }

  Widget info(Model card) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var entry in card.getMap().entries)
          Text('${entry.key}: ${entry.value}',
              style: theme.textTheme.bodyMedium),
        SizedBox(height: 10),
      ],
    );
  }

  Widget addBar(bool saveEnable, List<int> count, Function(int) onTap,
      int selectedIndex) {
    return Visibility(
        visible: saveEnable,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            height: 40,
            decoration: BoxDecoration(
              color: theme.primaryColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: count
                  .map((entry) =>
                      box(entry, count.indexOf(entry), onTap, selectedIndex))
                  .toList(),
            ),
          ),
        ));
  }

  Widget box(int count, int index, Function(int) onTap, int selectedIndex) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap(index),
        child: Container(
          decoration: BoxDecoration(
            color: index == selectedIndex
                ? theme.secondaryHeaderColor
                : theme.primaryColor,
            borderRadius: BorderRadius.circular(8),
            border: Border(
              left: BorderSide(
                  color: theme.iconTheme.color!.withOpacity(0.2), width: 2),
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(count.toString(), style: theme.textTheme.titleSmall),
              ],
            ),
          ),
        ),
      ),
    );
  }

  late final ThemeData theme = Theme.of(context);
  final BuildContext context;

  InfoWidget({required this.context});
}
