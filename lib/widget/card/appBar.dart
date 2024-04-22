import 'package:flutter/material.dart';
import 'package:project/widget/theme/color.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool save;
  final Function() onSave;

  const CustomAppBar({
    Key? key,
    required this.save,
    required this.onSave,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        if (save)
          Padding(
            padding: const EdgeInsets.only(right: 26.0, top: 8.0),
            child: GestureDetector(
              onTap: onSave,
              child: Text(
                'Save',
                style: TextStyle(color: subColor, fontWeight: FontWeight.bold),
              ),
            ),
          ),
      ],
    );
  }
}
