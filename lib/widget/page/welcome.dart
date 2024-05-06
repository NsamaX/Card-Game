import 'package:flutter/material.dart';
import 'package:project/page/deck.dart';

class WelcomeWidget {
  Widget image({required String image, required double size}) {
    return Image.asset(
      image,
      width: size,
      height: size,
      color: theme.iconTheme.color,
    );
  }

  Widget title({required String text}) {
    return Text(text, style: theme.textTheme.titleLarge);
  }

  Widget description({required String text}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 26),
      child: Text(
        text,
        style: theme.textTheme.bodyMedium,
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget startButton(
      {required String text,
      required double width,
      required VoidCallback changePage}) {
    return Container(
      width: width,
      child: ElevatedButton(
        onPressed: changePage,
        child: Text(text, style: theme.textTheme.titleSmall),
      ),
    );
  }

  Widget signOption(
      {required Map<String, String> image, required double size}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 60),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: image.entries
            .map((entry) => sign(image: entry.value, size: size))
            .toList(),
      ),
    );
  }

  Widget sign({required String image, required double size}) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        decoration: BoxDecoration(
          color: theme.iconTheme.color,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Image.asset(
            image,
            width: size,
            height: size,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget gameOption(
      {required Map<String, String> image, required double size}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 60),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: image.entries
            .map((entry) =>
                game(image: entry.value, size: size, game: entry.key))
            .toList(),
      ),
    );
  }

  Widget game(
      {required String image, required double size, required String game}) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: GestureDetector(
        onTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => DeckPage(game: game)),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color: theme.iconTheme.color,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Image.asset(
              image,
              width: size,
              height: size,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  late final ThemeData theme = Theme.of(context);
  final BuildContext context;

  WelcomeWidget({required this.context});
}
