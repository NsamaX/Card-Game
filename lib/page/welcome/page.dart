import 'package:flutter/material.dart';
import 'package:project/widget/theme.dart';
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
            Text('Welcome to', style: themE().textTheme.titleLarge),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Card Game Cafe',
                    style: themE().textTheme.titleLarge),
                Icon(Icons.coffee_rounded, size: 40.0)
              ],
            ),
            SizedBox(height: 26.0),
            Text(
              _c.getContent(),
              style: themE().textTheme.bodyMedium,
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
                    style: themE().textTheme.titleSmall),
                style: themE().elevatedButtonTheme.style,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
