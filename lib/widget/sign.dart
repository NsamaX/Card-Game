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
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          color: themE().primaryColorLight,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            image,
            width: 40.0,
            height: 40.0,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
