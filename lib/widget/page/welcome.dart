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
            image.entries.map((entry) => option(entry.value, width)).toList(),
      ),
    );
  }

  Widget option(String image, double width) {
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

  Widget guessButton(String text, double width) {
    return Center(
      child: Container(
        width: width,
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => DeckPage()),
            );
          },
          child: Text(text, style: theme.textTheme.titleSmall),
        ),
      ),
    );
  }

  late final ThemeData theme = Theme.of(context);
  final BuildContext context;

  WelcomeWidget({required this.context});
}
