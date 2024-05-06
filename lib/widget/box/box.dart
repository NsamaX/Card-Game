// TODO: add help box

import 'package:flutter/material.dart';
import 'package:project/widget/box/chat.dart';
import 'package:project/widget/box/filter.dart';
import 'package:project/widget/box/help.dart';

class BoxWidget {
  Widget filter(
      {required List<dynamic> filter,
      required bool filterBoxVisible,
      required double filterBoxWidth,
      required double filterBoxHeight}) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 400),
      curve: Curves.easeInOut,
      transform: Matrix4.translationValues(
          filterBoxVisible ? 0 : filterBoxWidth, 0, 0),
      child: Filter(
          filter: filter,
          filterBoxWidth: filterBoxWidth,
          filterBoxHeight: filterBoxHeight),
    );
  }

  Widget help(
      {required List<dynamic> help,
      required bool helpBoxVisible,
      required double helpBoxWidth,
      required double helpBoxHeight}) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 400),
      curve: Curves.easeInOut,
      transform:
          Matrix4.translationValues(0, helpBoxVisible ? 0 : -helpBoxHeight, 0),
      child: Help(
          help: help, helpBoxWidth: helpBoxWidth, helpBoxHeight: helpBoxHeight),
    );
  }

  Widget chat(
      {required Map<String, dynamic> log,
      required bool chatBoxVisible,
      required double chatBoxWidth,
      required double chatBoxHeight,
      required double messageMargin,
      required double sendButtonHeight}) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 400),
      curve: Curves.easeInOut,
      transform:
          Matrix4.translationValues(chatBoxVisible ? 0 : chatBoxWidth, 0, 0),
      child: Chat(
          log: log,
          chatBoxWidth: chatBoxWidth,
          chatBoxHeight: chatBoxHeight,
          messageMargin: messageMargin,
          sendButtonHeight: sendButtonHeight),
    );
  }
}
