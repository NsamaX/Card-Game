class message {
  final List<dynamic> _log = [
    {
      'sender': false,
      'message': 'Hello! How are you today?',
    },
    {
      'sender': true,
      'message': 'Hi there! I\'m doing well, thank you. How about you?',
    },
    {
      'sender': false,
      'message':
          'I\'m good too, thanks for asking. Did you do anything interesting recently?',
    },
    {
      'sender': true,
      'message': 'Yes, I went hiking last weekend. It was amazing!',
    },
    {
      'sender': false,
      'message': 'That sounds fun! I love hiking too. What trail did you take?',
    },
    {
      'sender': true,
      'message':
          'I hiked the Pine Ridge Trail. The view from the top was breathtaking!',
    },
    {
      'sender': false,
      'message':
          'Wow, I\'ve heard about that trail. It\'s supposed to have stunning views.',
    },
    {
      'sender': true,
      'message':
          'Absolutely! You should try it sometime if you get the chance.',
    },
    {
      'sender': false,
      'message': 'I definitely will. Thanks for the recommendation!',
    },
    {
      'sender': true,
      'message': 'Anytime! Have a great day!',
    },
  ];

  List<dynamic> getLog() => _log;
}
