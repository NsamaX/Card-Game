class contenT {
  final List<Map<String, dynamic>> _bar = [
    {'text': '', 'value': 1},
    {'text': '', 'value': 2},
    {'text': '', 'value': 3},
    {'text': '', 'value': 4},
  ];

  List<Map<String, dynamic>> getBar() => _bar;

  String getText(int index) => _bar[index]['text'];

  int getValue(int index) => _bar[index]['value'];
}
