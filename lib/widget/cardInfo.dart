import 'package:flutter/material.dart';
import 'package:project/api/model.dart';
import 'theme.dart';

class cardInfo extends StatelessWidget {
  final model _card;

  const cardInfo({Key? key, required model card})
      : _card = card,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Container(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Image.network(
                _card.getImage(),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        SizedBox(height: 20),
        for (var entry in _card.getMap().entries)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${entry.key}: ${entry.value}',
                style: themeData().textTheme.bodyMedium,
              ),
              SizedBox(height: 10),
            ],
          ),
      ],
    );
  }
}