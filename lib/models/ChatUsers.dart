import 'package:flutter/cupertino.dart';

class ChatUsers {
  String text;
  String secondaryText;
  String image;
  String time;
  bool isMessageReading;

  ChatUsers(
      {@required this.text,
      @required this.secondaryText,
      @required this.image,
      @required this.time,
      @required this.isMessageReading});
}
