import 'package:flutter/material.dart';
import 'theme.dart';

class sigN extends StatelessWidget {
  final Map<String, String> _image = {
    'Apple': 'assets/images/apple_logo.png',
    'Google': 'assets/images/google_logo.png',
    'Facebook': 'assets/images/facebook_logo.png',
  };

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: _image.entries.map((entry) => _option(entry.value)).toList(),
    );
  }

  Widget _option(String image) {
    final double _size = 40.0;

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
            width: _size,
            height: _size,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
