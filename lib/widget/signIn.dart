import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  final Map<String, String> _image = {
    'Apple': 'assets/images/apple_logo.png',
    'Google': 'assets/images/google_logo.png',
    'Facebook': 'assets/images/facebook_logo.png',
  };

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: _image.entries.map((entry) => _Icon(entry.value)).toList(),
    );
  }

  Widget _Icon(String image) {
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
