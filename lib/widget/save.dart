import 'package:flutter/material.dart';

class savE extends StatelessWidget implements PreferredSizeWidget {
  final bool _save;
  final Function() _onTap;

  const savE({
    Key? key,
    required bool save,
    required Function() onTap,
  })  : _save = save,
        _onTap = onTap,
        super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        if (_save)
          Padding(
            padding: const EdgeInsets.only(right: 22.0),
            child: GestureDetector(
              onTap: _onTap,
              child: Text('Save'),
            ),
          ),
      ],
    );
  }
}
