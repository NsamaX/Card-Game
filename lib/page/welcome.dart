import 'package:flutter/material.dart';
import 'signIn.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData _theme = Theme.of(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'asset/image/welcome.png',
                width: 260,
                height: 260,
              ),
              Text('Welcome to', style: _theme.textTheme.titleLarge),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Card Game Cafe', style: _theme.textTheme.titleLarge),
                  Icon(Icons.coffee_rounded, size: 40.0),
                ],
              ),
              SizedBox(height: 26.0),
              Text(
                'This app was created so that anyone interested in playing card games can play wherever they are or if they don\'t have cards and can have the deck of their dreams.',
                style: _theme.textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 36.0),
              Container(
                width: 260.0,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => SignInPage()),
                    );
                  },
                  child:
                      Text('Get started', style: _theme.textTheme.titleSmall),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
