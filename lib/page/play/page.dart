import 'package:flutter/material.dart';
import 'package:project/widget/appBar.dart';
import 'package:project/widget/buttomNav.dart';
import 'package:project/widget/room.dart';
import 'contents.dart';
import 'icons.dart';

class PlayPage extends StatefulWidget {
  const PlayPage({Key? key}) : super(key: key);

  @override
  State<PlayPage> createState() => _PlayPageState();
}

class _PlayPageState extends State<PlayPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: apPbaR(
        menu: icons,
        onTap: getOnTapCallbacks(context),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                rooM(room: roomsList, page: 30, icon: 6),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: bottoMnaV(currentIndex: 1),
    );
  }
}
