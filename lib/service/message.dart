// TODO: get log by API

class MessageService {
  final Map<String, dynamic> log = {
    'id': 'null',
    'log': {
      {
        'from': 'sender',
        'message': 'Hello! How are you today?',
      },
      {
        'from': 'receiver',
        'message': 'Hi there! I\'m doing well, thank you. How about you?',
      },
      {
        'from': 'sender',
        'message':
            'I\'m good too, thanks for asking. Did you do anything interesting recently?',
      },
      {
        'from': 'receiver',
        'message': 'Yes, I went hiking last weekend. It was amazing!',
      },
      {
        'from': 'sender',
        'message':
            'That sounds fun! I love hiking too. What trail did you take?',
      },
      {
        'from': 'receiver',
        'message':
            'I hiked the Pine Ridge Trail. The view from the top was breathtaking!',
      },
      {
        'from': 'sender',
        'message':
            'Wow, I\'ve heard about that trail. It\'s supposed to have stunning views.',
      },
      {
        'from': 'receiver',
        'message':
            'Absolutely! You should try it sometime if you get the chance.',
      },
      {
        'from': 'sender',
        'message': 'I definitely will. Thanks for the recommendation!',
      },
      {
        'from': 'receiver',
        'message': 'Anytime! Have a great day!',
      },
    },
  };

  Map<String, dynamic> getLog() => log;
}
