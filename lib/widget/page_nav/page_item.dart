import 'package:flutter/material.dart';
import 'package:project/theme_color.dart';

class PageItem extends StatelessWidget {
  final int page;
  final int currentPage;
  final Function(int) onTap;

  const PageItem({
    Key? key,
    required this.page,
    required this.currentPage,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          onTap(page);
        },
        child: Container(
          height: 30.0,
          width: 30.0,
          decoration: BoxDecoration(
            color: page == currentPage ? subColor : mainColor4,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              (page + 1).toString(),
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
