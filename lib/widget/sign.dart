import 'package:flutter/material.dart';
import 'theme.dart';

class sigN extends StatelessWidget {
  final Map<String, String> _option = {
    'Apple': 'assets/images/apple_logo.png',
    'Google': 'assets/images/google_logo.png',
    'Facebook': 'assets/images/facebook_logo.png',
  };

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: _option.entries.map((entry) => _sign(entry.value)).toList(),
    );
  }

  Widget _sign(String image) {
    final double optionSize = 40.0;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          color: themE().iconTheme.color,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            image,
            width: optionSize,
            height: optionSize,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
