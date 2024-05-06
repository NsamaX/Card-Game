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
                pageWidget.image(image: 'asset/image/welcome.png', size: 260),
                pageWidget.title(text: 'Welcome'),
                pageWidget.description(
                    text:
                        'This app was created so that anyone interested in playing card games can play wherever they are or if they don\'t have cards and can have the deck of their dreams.'),
                pageWidget.startButton(
                    text: 'Get start',
                    width: 260,
                    changePage: () {
                      pageController.animateToPage(1,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeInOut);
                    }),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                pageWidget.title(text: 'Let\'s me know you.'),
                pageWidget.signOption(image: {
                  'apple': 'asset/image/logo/apple.png',
                  'goodle': 'asset/image/logo/google.png',
                  'facebook': 'asset/image/logo/facebook.png'
                }, size: 40),
                pageWidget.startButton(
                    text: 'Guess',
                    width: 260,
                    changePage: () {
                      pageController.animateToPage(2,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeInOut);
                    }),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                pageWidget.title(text: 'Choose the game you want to play.'),
                pageWidget.gameOption(image: {
                  'pokemon': 'asset/image/logo/pokemon.png',
                  'cfv': 'asset/image/logo/cfv.png'
                }, size: 60)
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
