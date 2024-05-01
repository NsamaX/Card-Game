import 'package:flutter/material.dart';
import 'package:project/widget/signIcon.dart';
import 'deck.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData _theme = Theme.of(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Let\'s me know you.',
              style: _theme.textTheme.titleLarge,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 60.0),
              child: SignIcon(),
            ),
            Center(
              child: Container(
                width: 260.0,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => DeckPage()),
                    );
                  },
                  child: Text(
                    'Guess',
                    style: _theme.textTheme.titleSmall,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
