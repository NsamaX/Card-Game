import 'package:flutter/material.dart';
import 'package:project/widget/sign.dart';
import 'package:project/widget/theme.dart';
import '../deck/page.dart';

class sigNpagE extends StatelessWidget {
  const sigNpagE({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Let\'s me know you.',
              style: themE().textTheme.titleLarge,
            ),
            SizedBox(height: 60.0),
            sigN(),
            SizedBox(height: 60.0),
            Center(
              child: Container(
                width: 260.0,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => decKpagE(),
                      ),
                    );
                  },
                  child: Text(
                    'Guess',
                    style: themE().textTheme.titleSmall,
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
