import 'package:flutter/material.dart';
import 'package:project/widget/theme.dart';
import '../sign/page.dart';

class welcomEpagE extends StatelessWidget {
  const welcomEpagE({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/welcome.png',
                width: 260,
                height: 260,
              ),
              Text('Welcome to', style: themE().textTheme.titleLarge),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Card Game Cafe', style: themE().textTheme.titleLarge),
                  Icon(Icons.coffee_rounded, size: 40.0),
                ],
              ),
              SizedBox(height: 26.0),
              Text(
                'This app was created so that anyone interested in playing card games can play wherever they are or if they don\'t have cards and can have the deck of their dreams.',
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
                      MaterialPageRoute(
                        builder: (context) => sigNpagE(),
                      ),
                    );
                  },
                  child:
                      Text('Get started', style: themE().textTheme.titleSmall),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
