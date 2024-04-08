import 'package:flutter/material.dart';
import 'package:project/widget/sign_icon.dart';
import '../deck/page.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.symmetric(vertical: 30.0 * 2, horizontal: 40.0),
        child: Column(children: [
          Text(
            'Let\'s me know you.',
            style: TextStyle(color: Colors.white, fontSize: 40.0),
          ),
          SizedBox(height: 160.0),
          SignIcon(),
          SizedBox(height: 30.0),
          Container(
            width: 260.0,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => DeckPage()),
                );
              },
              child: Text('Guess',
                  style: TextStyle(color: Colors.black, fontSize: 20.0)),
            ),
          ),
        ]),
      ),
    );
  }
}
