class contenT {
  final List<List<String>> _field = [
    ['Drop\nZone', 'Card', 'Card', 'Card', 'Damage\nZone'],
    ['Oposite\nMain\nDeck', 'Card', 'Card', 'Card', 'Oposite\nSpecial\nDeck'],
    ['Bind\nZone', 'Show\nCard', 'Guard', 'Trigger', 'Special\nZone'],
    ['Special\nZone', 'Show\nCard', 'Guard', 'Trigger', 'Bind\nZone'],
    ['Special\nDeck', 'Card', 'Card', 'Card', 'Main\nDeck'],
    ['Damage\nZone', 'Card', 'Card', 'Card', 'Drop\nZone'],
  ];

  List<List<String>> getField() => _field;
}
