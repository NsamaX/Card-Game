// TODO: add help box

import 'package:flutter/material.dart';
import 'package:project/widget/box/chat.dart';
import 'package:project/widget/box/filter.dart';
import 'package:project/widget/box/help.dart';

class BoxWidget {
  Widget filter(List<dynamic> filter, bool filterBoxVisibility,
      double filterBoxWidth, double filterBoxHeight) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 400),
      curve: Curves.easeInOut,
      transform: Matrix4.translationValues(
          filterBoxVisibility ? 0 : filterBoxWidth, 0, 0),
      child: Filter(
          filter: filter,
          filterBoxWidth: filterBoxWidth,
          filterBoxHeight: filterBoxHeight),
    );
  }

  Widget help(List<dynamic> help, bool helpBoxVisible, double helpBoxWidth,
      double helpBoxHeight) {
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
      Map<String, dynamic> log,
      bool chatBoxVisible,
      double chatBoxWidth,
      double chatBoxHeight,
      double messageMargin,
      double sendButtonHeight) {
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
