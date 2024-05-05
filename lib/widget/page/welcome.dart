import 'package:flutter/material.dart';
import 'package:project/page/deck.dart';

class WelcomeWidget {
  Widget image(String image, double size) {
    return Image.asset(
      image,
      width: size,
      height: size,
      color: theme.iconTheme.color,
    );
  }

  Widget title(String text) {
    return Text(text, style: theme.textTheme.titleLarge);
  }

  Widget description(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 26),
      child: Text(
        text,
        style: theme.textTheme.bodyMedium,
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget startButton(String text, double width, VoidCallback changePage) {
    return Container(
      width: width,
      child: ElevatedButton(
        onPressed: changePage,
        child: Text(text, style: theme.textTheme.titleSmall),
      ),
    );
  }

  Widget signOption(Map<String, String> image, double width) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 60),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children:
            image.entries.map((entry) => sign(entry.value, width)).toList(),
      ),
    );
  }

  Widget sign(String image, double width) {
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
            width: width,
            height: width,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget gameOption(Map<String, String> image, double width) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 60),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: image.entries
            .map((entry) => game(entry.value, width, entry.key))
            .toList(),
      ),
    );
  }

  Widget game(String image, double width, String game) {
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
              width: width,
              height: width,
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
