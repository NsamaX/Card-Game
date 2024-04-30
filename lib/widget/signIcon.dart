import 'package:flutter/material.dart';
import 'theme.dart';

class signIcon extends StatelessWidget {
  final List<String> _image;
  final double _size = 40.0;

  const signIcon({Key? key, required List<String> image})
      : _image = image,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: _image.map((entry) => _icon(entry)).toList(),
    );
  }

  Widget _icon(String image) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          color: themeData().iconTheme.color,
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
