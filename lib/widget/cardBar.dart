import 'package:flutter/material.dart';
import 'color.dart';

class carDbaR extends StatefulWidget {
  final List<Map<String, dynamic>> _data;
  final Function(int) _onTap;

  const carDbaR({
    Key? key,
    required List<Map<String, dynamic>> data,
    required Function(int) onTap,
  })  : _data = data,
        _onTap = onTap,
        super(key: key);

  @override
  State<carDbaR> createState() => _carDbaRState();
}

class _carDbaRState extends State<carDbaR> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
      child: Container(
        height: 40.0,
        decoration: BoxDecoration(
          color: primary4,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          children: List.generate(
            widget._data.length,
            (index) {
              return buildcarDbaR(
                widget._data[index]['text'],
                widget._data[index]['value'],
                index,
              );
            },
          ).toList(),
        ),
      ),
    );
  }

  Widget buildcarDbaR(String text, int card, int index) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedIndex = index;
          });
          widget._onTap(index);
        },
        child: Container(
          decoration: BoxDecoration(
            color: index == _selectedIndex ? Colors.white : primary4,
            borderRadius: BorderRadius.circular(8.0),
            border: Border(
              left: BorderSide(
                color: Colors.white.withOpacity(0.2),
                width: 2.0,
              ),
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (text != '') Text(text),
                Text(
                  card.toString(),
                  style: TextStyle(
                    color:
                        index == _selectedIndex ? Colors.black : Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
