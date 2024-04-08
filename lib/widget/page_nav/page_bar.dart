import 'package:flutter/material.dart';
import 'operator.dart';
import 'page_item.dart';

class PageBar extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final int maxPageIcon;
  final Function(String) onOperatorTap;
  final Function(int) onPageTap;

  const PageBar({
    Key? key,
    required this.currentPage,
    required this.totalPages,
    required this.maxPageIcon,
    required this.onOperatorTap,
    required this.onPageTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int startPage = currentPage ~/ maxPageIcon * maxPageIcon;
    int endPage = startPage + maxPageIcon;
    if (endPage > totalPages) endPage = totalPages;
    if (startPage - endPage < maxPageIcon) {
      startPage = endPage - maxPageIcon;
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (currentPage >= maxPageIcon)
          Operator(operator: '-', onTap: onOperatorTap),
        for (int page = startPage; page < endPage; page++)
          PageItem(page: page, currentPage: currentPage, onTap: onPageTap),
        if (endPage < totalPages) Operator(operator: '+', onTap: onOperatorTap),
      ],
    );
  }
}
