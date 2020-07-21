import 'package:flutter/material.dart';
import 'package:messenger/models/chat_message.dart';
import 'package:messenger/modules/ChatDetailPage.dart';

class ChatBubble extends StatefulWidget {
  ChatMessage message;

  ChatBubble({@required this.message});

  @override
  _ChatBubbleState createState() => _ChatBubbleState();
}

class _ChatBubbleState extends State<ChatBubble> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
      child: Align(
        alignment: (widget.message.type == MessageType.receiver
            ? Alignment.topLeft
            : Alignment.topRight),
        child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: (widget.message.type == MessageType.receiver
                ? BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                    bottomRight: Radius.circular(30))
                : BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30))),
            color: (widget.message.type == MessageType.receiver
                ? Colors.white
                : Colors.green),
          ),
          child: Text(widget.message.message),
        ),
      ),
    );
  }
}
