import 'package:flutter/material.dart';
import '../sign/sign.dart';
import 'content.dart';

class welcomE extends StatelessWidget {
  const welcomE({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    content _c = content();

    return Scaffold(
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
              _c.getContent(),
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
