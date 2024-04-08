import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final BuildContext context;
  final List<dynamic> icons;
  final List<Function> onTapCallbacks;
  final int titleIndex;

  CustomAppBar({
    Key? key,
    required this.context,
    required this.icons,
    required this.onTapCallbacks,
  })  : titleIndex = (icons.length / 2).round() - 1,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: buildIconRow(context),
    );
  }

  Widget buildIconRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: icons.asMap().entries.map((entry) {
        final index = entry.key;
        final icon = entry.value;
        return buildIconWidget(context, index, icon);
      }).toList(),
    );
  }

  Widget buildIconWidget(BuildContext context, int index, dynamic icon) {
    final isTitleIndex = index == titleIndex;

    return GestureDetector(
      onTap: () {
        if (index < onTapCallbacks.length) {
          onTapCallbacks[index].call();
        }
      },
      child: iconTypeSelector(icon, isTitleIndex),
    );
  }

  Widget iconTypeSelector(dynamic icon, bool isTitleIndex) {
    if (icon is String) {
      return Text(
        '$icon',
        style: TextStyle(
          color: isTitleIndex
              ? Colors.white
              : Theme.of(context).textTheme.bodyText1?.color,
          fontWeight: FontWeight.bold,
          fontSize: isTitleIndex ? 20.0 : 16.0,
        ),
      );
    } else if (icon is IconData) {
      return Icon(
        icon,
        color: Colors.blue,
      );
    } else {
      return SizedBox(
        width: 30.0,
      );
    }
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
