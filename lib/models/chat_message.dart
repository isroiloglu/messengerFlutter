import 'package:flutter/material.dart';
import 'package:messenger/modules/ChatDetailPage.dart';

class ChatMessage {
  String message;
  MessageType type;

  ChatMessage({@required this.type, @required this.message});
}
