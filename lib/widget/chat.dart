import 'package:flutter/material.dart';
import 'theme.dart';

class chat extends StatelessWidget {
  final List<dynamic> _log;
  final double _messageFree;
  final double _sendButton;

  const chat(
      {Key? key,
      required List<dynamic> log,
      required double messageFree,
      required double sendButton})
      : _log = log,
        _messageFree = messageFree,
        _sendButton = sendButton,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        for (var message in _log) _message(message),
        _send(),
      ],
    );
  }

  Widget _message(Map<String, dynamic> data) {
    final double _leftPadding = data['sender'] ? _messageFree : 0.0;
    final double _rightPadding = data['sender'] ? 0.0 : _messageFree;

    return Align(
      alignment: data['sender'] ? Alignment.centerRight : Alignment.centerLeft,
      child: Padding(
        padding:
            EdgeInsets.fromLTRB(_leftPadding, 0.0, _rightPadding, _messageFree),
        child: Container(
          decoration: BoxDecoration(
            color: data['sender']
                ? themeData().secondaryHeaderColor
                : themeData()
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
              style: themeData().textTheme.bodyMedium,
            ),
          ),
        ),
      ),
    );
  }

  Widget _send() {
    return Expanded(
      child: Container(
        height: _sendButton,
        decoration: BoxDecoration(
          color: themeData().iconTheme.color,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'messages',
                style: themeData()
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: themeData().primaryColor),
              ),
              IconButton(
                icon: Icon(Icons.send_rounded, color: themeData().primaryColor),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
