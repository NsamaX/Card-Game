class messagE {
  final List<dynamic> _message = [
    {
      'sender': false,
      'message': 'hello',
    },
    {
      'sender': true,
      'message': 'hi',
    }
  ];

  List<dynamic> getMessage() => _message;
}
