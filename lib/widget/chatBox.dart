import 'package:flutter/material.dart';
import 'chat.dart';

class ChatBox extends StatefulWidget {
  final List<dynamic> _log;

  const ChatBox({Key? key, required List<dynamic> log})
      : _log = log,
        super(key: key);

  @override
  State<ChatBox> createState() => _ChatBoxState();
}

class _ChatBoxState extends State<ChatBox> with SingleTickerProviderStateMixin {
  final double _messageFreeSize = 16.0;
  final double _sendButtonSize = 40.0;

  late AnimationController _ChatBoxController;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _ChatBoxController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
    );
    _offsetAnimation = Tween<Offset>(
      begin: Offset(1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _ChatBoxController,
      curve: Curves.easeInOut,
    ));
    _ChatBoxController.forward();
  }

  @override
  void dispose() {
    _ChatBoxController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData _theme = Theme.of(context);

    return SlideTransition(
      position: _offsetAnimation,
      child: Align(
        alignment: Alignment.topRight,
        child: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Container(
            width: 200.0,
            constraints: BoxConstraints(maxHeight: 360.0),
            decoration: BoxDecoration(
              color: _theme.appBarTheme.backgroundColor,
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Chat(
                log: widget._log,
                messageFreeSize: _messageFreeSize,
                sendButtonSize: _sendButtonSize),
          ),
        ),
      ),
    );
  }
}
