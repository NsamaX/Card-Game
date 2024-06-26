import 'package:flutter/material.dart';

class _HelpState extends State<Help> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: offsetAnimation,
      child: Align(
        alignment: Alignment.topLeft,
        child: helpBox(),
      ),
    );
  }

  Widget helpBox() {
    return Container(
      width: widget.helpBoxWidth,
      constraints: BoxConstraints(maxHeight: widget.helpBoxHeight),
      decoration: BoxDecoration(
        color: theme.appBarTheme.backgroundColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
      ),
      // child: ListView(
      //   children: widget.help
      //       .map((data) => info(data['icon'], data['text']))
      //       .toList(),
      // ),
    );
  }

  Widget info({required IconData? icon, required String text}) {
    return Container();
  }

  @override
  void initState() {
    super.initState();
    helpBoxController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
    );
    offsetAnimation = Tween<Offset>(
      begin: Offset(1, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: helpBoxController,
      curve: Curves.easeInOut,
    ));
    helpBoxController.forward();
  }

  @override
  void dispose() {
    helpBoxController.dispose();
    super.dispose();
  }

  late AnimationController helpBoxController;
  late Animation<Offset> offsetAnimation;

  late final ThemeData theme = Theme.of(context);
}

class Help extends StatefulWidget {
  final List<dynamic> help;
  final double helpBoxHeight;
  final double helpBoxWidth;

  const Help(
      {Key? key,
      required this.help,
      required this.helpBoxHeight,
      required this.helpBoxWidth})
      : super(key: key);

  @override
  State<Help> createState() => _HelpState();
}
