import 'package:flutter/material.dart';
import 'chat.dart';
import 'theme.dart';

class chatBox extends StatefulWidget {
  final List<dynamic> _log;

  const chatBox({Key? key, required List<dynamic> log})
      : _log = log,
        super(key: key);

  @override
  State<chatBox> createState() => _chatBoxState();
}

class _chatBoxState extends State<chatBox> with SingleTickerProviderStateMixin {
  late AnimationController _chatBoxController;
  late Animation<Offset> _offsetAnimation;
  final double _free = 16.0;
  final double _sendButton = 40.0;

  @override
  void initState() {
    super.initState();
    _chatBoxController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
    );
    _offsetAnimation = Tween<Offset>(
      begin: Offset(1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _chatBoxController,
      curve: Curves.easeInOut,
    ));
    _chatBoxController.forward();
  }

  @override
  void dispose() {
    _chatBoxController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offsetAnimation,
      child: Align(
        alignment: Alignment.topRight,
        child: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Container(
            width: 200.0,
            height:
                (widget._log.length * (_sendButton * 2)) + _free + _sendButton,
            constraints: BoxConstraints(maxHeight: 360.0),
            decoration: BoxDecoration(
              color: themeData().appBarTheme.backgroundColor,
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: chat(log: widget._log, messageFree: 8.0, sendButton: 40.0),
            ),
          ),
        ),
      ),
    );
  }
}
