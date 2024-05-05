// TODO: create function for sign in each option

import 'package:flutter/material.dart';
import 'package:project/widget/page/welcome.dart';

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: PageView(
          controller: pageController,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                pageWidget.image('asset/image/welcome.png', 260),
                pageWidget.title('Welcome'),
                pageWidget.description(
                    'This app was created so that anyone interested in playing card games can play wherever they are or if they don\'t have cards and can have the deck of their dreams.'),
                pageWidget.startButton('Get start', 260, () {
                  pageController.animateToPage(1,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeInOut);
                }),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                pageWidget.title('Let\'s me know you.'),
                pageWidget.signOption({
                  'apple': 'asset/image/apple.png',
                  'goodle': 'asset/image/google.png',
                  'facebook': 'asset/image/facebook.png'
                }, 40),
                pageWidget.guessButton('Guess', 260),
              ],
            ),
          ],
        ),
      ),
    );
  }

  PageController pageController = PageController(initialPage: 0);

  late final WelcomeWidget pageWidget = WelcomeWidget(context: context);
}

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}
