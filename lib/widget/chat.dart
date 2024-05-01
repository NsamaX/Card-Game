import 'package:flutter/material.dart';

class Chat extends StatelessWidget {
  final List<dynamic> _log;
  final double _messageFreeSize;
  final double _sendButtonSize;

  const Chat(
      {Key? key,
      required List<dynamic> log,
      required double messageFreeSize,
      required double sendButtonSize})
      : _log = log,
        _messageFreeSize = messageFreeSize,
        _sendButtonSize = sendButtonSize,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData _theme = Theme.of(context);

    return Column(
      children: [
        Expanded(
          child: ListView(
            children: [
              for (var message in _log) _message(_theme, message),
            ],
          ),
        ),
        SizedBox(height: _messageFreeSize),
        _sendButton(_theme),
      ],
    );
  }

  Widget _message(ThemeData theme, Map<String, dynamic> data) {
    final double _leftPadding = data['sender'] ? _messageFreeSize : 0.0;
    final double _rightPadding = data['sender'] ? 0.0 : _messageFreeSize;

    return Align(
      alignment: data['sender'] ? Alignment.centerRight : Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.fromLTRB(
            _leftPadding, 0.0, _rightPadding, _messageFreeSize),
        child: Container(
          decoration: BoxDecoration(
            color: data['sender']
                ? theme.secondaryHeaderColor
                : theme.elevatedButtonTheme.style!.backgroundColor!.resolve({}),
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              data['message'],
              style: theme.textTheme.bodyMedium,
            ),
          ),
        ),
      ),
    );
  }

  Widget _sendButton(ThemeData theme) {
    return Container(
      height: _sendButtonSize,
      decoration: BoxDecoration(
        color: theme.iconTheme.color,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0),
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
}
