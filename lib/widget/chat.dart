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
            height: 360.0,
            decoration: BoxDecoration(
              color: themE().appBarTheme.backgroundColor,
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: [
                  _message(false, 'hello'),
                  _message(true, 'hi'),
                  _message(false, 'how are you'),
                  _message(true, 'i am fine'),
                  _message(true, 'what are you doing?'),
                  _message(false, 'doing nothing'),
                  _message(true, 'good'),
                  _message(false, 'bye'),
                  _message(true, 'see you'),
                  _send(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _message(bool sender, String message) {
    return Align(
      alignment: sender ? Alignment.centerRight : Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6.0),
        child: Container(
          decoration: BoxDecoration(
            color: sender
                ? themE().secondaryHeaderColor
                : themE()
                    .elevatedButtonTheme
                    .style!
                    .backgroundColor!
                    .resolve({}),
            borderRadius: BorderRadius.circular(26.0),
          ),
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                message,
                style: themE().textTheme.bodyMedium,
              )),
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
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('messages',
                      style: themE()
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: themE().primaryColor)),
                  Icon(
                    Icons.send_rounded,
                    color: themE().primaryColor,
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
