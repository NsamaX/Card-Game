import 'package:flutter/material.dart';
import 'theme.dart';

class boarD extends StatelessWidget {
  final List<Map<int, dynamic>> _field;

  boarD({
    Key? key,
    required List<Map<int, dynamic>> field,
  })  : _field = field,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 36.0, horizontal: 10.0),
      child: ListView.builder(
        itemCount: _field.length,
        itemBuilder: (context, index) {
          Map<int, dynamic> data = _field[index];
          return Column(
            children: [
              for (var map in data.values)
                Row(
                  children: [
                    for (var field in map.values) _boarD(field),
                  ],
                ),
            ],
          );
        },
      ),
    );
  }

  Widget _boarD(Map<String, dynamic> data) {
    String name = data['field']['name'];

    return Expanded(
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 80.0,
              decoration: BoxDecoration(
                color: themE().appBarTheme.backgroundColor,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Center(
                child: Text(
                  name,
                  style: themE().textTheme.bodySmall?.copyWith(
                        color: themE().primaryColorLight.withOpacity(0.6),
                      ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          Positioned(
            top: 0.0,
            right: 0.0,
            child: Column(
              children: [
                for (var action in data['action'])
                  if (action.length > 0)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: action is String
                          ? Text(
                              action,
                              style: themE().textTheme.bodySmall,
                            )
                          : Icon(action.keys.first),
                      // : Container(),
                    ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
