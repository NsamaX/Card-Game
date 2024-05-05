import 'package:flutter/material.dart';

class _ChatState extends State<Chat> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: offsetAnimation,
      child: Align(
        alignment: Alignment.topRight,
        child: Padding(
          padding: const EdgeInsets.only(top: 16),
          child: chatBox(),
        ),
      ),
    );
  }

  Widget chatBox() {
    return Container(
      width: widget.chatBoxWidth,
      constraints: BoxConstraints(maxHeight: widget.chatBoxHeight),
      decoration: BoxDecoration(
        color: theme.appBarTheme.backgroundColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: [for (var data in widget.log['log']) message(data)],
            ),
          ),
          SizedBox(height: widget.messageMargin),
          sendButton(),
        ],
      ),
    );
  }

  Widget message(Map<String, dynamic> data) {
    final bool isSender = data['from'] == 'sender';
    final double leftPadding = isSender ? widget.messageMargin : 0;
    final double rightPadding = isSender ? 0 : widget.messageMargin;

    return Align(
      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.fromLTRB(
            leftPadding, 0, rightPadding, widget.messageMargin),
        child: Container(
          decoration: BoxDecoration(
            color: isSender
                ? theme.secondaryHeaderColor
                : theme.elevatedButtonTheme.style!.backgroundColor!.resolve({}),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Text(data['message'], style: theme.textTheme.bodyMedium),
          ),
        ),
      ),
    );
  }

  Widget sendButton() {
    return Container(
      height: widget.sendButtonHeight,
      decoration: BoxDecoration(
        color: theme.iconTheme.color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'messages',
              style: theme.textTheme.bodyMedium
                  ?.copyWith(color: theme.primaryColor),
            ),
            IconButton(
              icon: Icon(Icons.send_rounded, color: theme.primaryColor),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    chatBoxController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
    );
    offsetAnimation = Tween<Offset>(
      begin: Offset(1, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: chatBoxController,
      curve: Curves.easeInOut,
    ));
    chatBoxController.forward();
  }

  @override
  void dispose() {
    chatBoxController.dispose();
    super.dispose();
  }

  late AnimationController chatBoxController;
  late Animation<Offset> offsetAnimation;

  late final ThemeData theme = Theme.of(context);
}

class Chat extends StatefulWidget {
  final Map<String, dynamic> log;
  final double chatBoxWidth;
  final double chatBoxHeight;
  final double messageMargin;
  final double sendButtonHeight;

  const Chat(
      {Key? key,
      required this.log,
      required this.chatBoxWidth,
      required this.chatBoxHeight,
      required this.messageMargin,
      required this.sendButtonHeight})
      : super(key: key);

  @override
  State<Chat> createState() => _ChatState();
}
