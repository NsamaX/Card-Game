import 'package:flutter/material.dart';

class sigN extends StatelessWidget {
  final Map<String, String> _imagePath = {
    'Apple': 'assets/images/apple_logo.png',
    'Google': 'assets/images/google_logo.png',
    'Facebook': 'assets/images/facebook_logo.png',
  };

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: _imagePath.entries.map((entry) => _icon(entry.value)).toList(),
    );
  }

  Widget _icon(String imagePath) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            imagePath,
            width: 40.0,
            height: 40.0,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
