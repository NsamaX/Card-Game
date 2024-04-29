import 'package:flutter/material.dart';
import 'package:project/widget/option.dart';
import 'package:project/widget/theme.dart';
import '../deck/page.dart';

class signIn extends StatelessWidget {
  const signIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> _image = [
      'asset/image/apple.png',
      'asset/image/google.png',
      'asset/image/facebook.png',
    ];

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Let\'s me know you.',
              style: themeData().textTheme.titleLarge,
            ),
            SizedBox(height: 60.0),
            option(image: _image),
            SizedBox(height: 60.0),
            Center(
              child: Container(
                width: 260.0,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => decKpagE()),
                    );
                  },
                  child: Text(
                    'Guess',
                    style: themeData().textTheme.titleSmall,
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
