import 'package:flutter/material.dart';
import 'package:project/theme_color.dart';
import 'signIn.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor2,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image.asset(
              'assets/images/welcome.png',
              width: 260,
              height: 260,
            ),
            Text('Welcome to',
                style: TextStyle(color: Colors.white, fontSize: 40.0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Card Game Cafe',
                    style: TextStyle(color: Colors.white, fontSize: 30.0)),
                Icon(Icons.coffee_rounded, color: Colors.white, size: 40.0)
              ],
            ),
            SizedBox(height: 26.0),
            Text(
              'This app was created so that anyone interested in playing card games can play wherever they are or if they don\'t have cards and can have the deck of their dreams.',
              style: TextStyle(color: Colors.white, fontSize: 16.0),
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
                child: Text('Get started',
                    style: TextStyle(color: Colors.black, fontSize: 20.0)),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
