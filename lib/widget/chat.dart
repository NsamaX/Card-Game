import 'package:flutter/material.dart';
import 'theme.dart';

class chaT extends StatefulWidget {
  final List<dynamic> _message;

  const chaT({Key? key, required List<dynamic> message})
      : _message = message,
        super(key: key);

  @override
  State<chaT> createState() => _chathaTState();
}

class _chathaTState extends State<chaT> with SingleTickerProviderStateMixin {
  late AnimationController _chatontroller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _chatontroller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
    );
    _offsetAnimation = Tween<Offset>(
      begin: Offset(1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _chatontroller,
      curve: Curves.easeInOut,
    ));
    _chatontroller.forward();
  }

  @override
  void dispose() {
    _chatontroller.dispose();
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
            height: widget._message.length * 60.0 + 68.0,
            constraints: BoxConstraints(maxHeight: 360.0),
            decoration: BoxDecoration(
              color: themE().appBarTheme.backgroundColor,
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: [
                  for (var message in widget._message) _message(message),
                  _send(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _message(Map<String, dynamic> data) {
    final double leftPadding = data['sender'] ? 16.0 : 0.0;
    final double rightPadding = data['sender'] ? 0.0 : 16.0;

    return Align(
      alignment: data['sender'] ? Alignment.centerRight : Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.fromLTRB(leftPadding, 6.0, rightPadding, 6.0),
        child: Container(
          decoration: BoxDecoration(
            color: data['sender']
                ? themE().secondaryHeaderColor
                : themE()
                    .elevatedButtonTheme
                    .style!
                    .backgroundColor!
                    .resolve({}),
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              data['message'],
              style: themE().textTheme.bodyMedium,
            ),
          ),
        ),
      ),
    );
  }

  Widget _send() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 6.0),
        child: Container(
          height: 40.0,
          decoration: BoxDecoration(
            color: themE().iconTheme.color,
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('messages',
                      style: themE()
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: themE().primaryColor)),
                  IconButton(
                    icon: Icon(Icons.send_rounded, color: themE().primaryColor),
                    onPressed: () {},
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}