import 'package:flutter/material.dart';

class SignIcon extends StatelessWidget {
  final double _optionSize = 40.0;

  final List<String> _image;

  const SignIcon({Key? key, required List<String> image})
      : _image = image,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData _theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: _image.map((entry) => _option(_theme, entry)).toList(),
    );
  }

  Widget _option(ThemeData theme, String image) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          color: theme.iconTheme.color,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            image,
            width: _optionSize,
            height: _optionSize,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
