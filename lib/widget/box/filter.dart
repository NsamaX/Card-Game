import 'package:flutter/material.dart';

class _FilterState extends State<Filter> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: offsetAnimation,
      child: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Align(
          alignment: Alignment.topRight,
          child: filterBox(),
        ),
      ),
    );
  }

  Widget filterBox() {
    return Container(
      width: widget.filterBoxWidth,
      constraints: BoxConstraints(maxHeight: widget.filterBoxHeight),
      decoration: BoxDecoration(
        color: theme.appBarTheme.backgroundColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: filter(),
    );
  }

  Widget filter() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text('Filter Options', style: theme.textTheme.titleSmall),
          ),
          Column(
              children: widget.filter.map((entry) => category(entry)).toList()),
        ],
      ),
    );
  }

  Widget category(List<dynamic> options) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: theme.iconTheme.color!.withOpacity(0.6)),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
            children: options
                .map(
                    (entry) => option(icon: entry['icon'], text: entry['text']))
                .toList()),
      ),
    );
  }

  Widget option({required IconData? icon, required String text}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          icon != null ? Icon(icon) : SizedBox(width: theme.iconTheme.size),
          SizedBox(width: 8),
          Text(text, style: theme.textTheme.bodyMedium),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
    );
    offsetAnimation = Tween<Offset>(
      begin: Offset(1, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: controller,
      curve: Curves.easeInOut,
    ));
    controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  late AnimationController controller;
  late Animation<Offset> offsetAnimation;

  late ThemeData theme = Theme.of(context);
}

class Filter extends StatefulWidget {
  final List<dynamic> filter;
  final double filterBoxWidth;
  final double filterBoxHeight;

  const Filter(
      {Key? key,
      required this.filter,
      required this.filterBoxWidth,
      required this.filterBoxHeight})
      : super(key: key);

  @override
  State<Filter> createState() => _FilterState();
}
