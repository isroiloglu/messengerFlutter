import 'package:flutter/material.dart';
import 'package:messenger/modules/ChatDetailPage.dart';

class ChatUserList extends StatefulWidget {
  String text;
  String secondaryText;
  String image;
  String time;
  bool isMessageReading;

  ChatUserList(
      {@required this.text,
      @required this.secondaryText,
      @required this.image,
      @required this.time,
      @required this.isMessageReading});

  @override
  _ChatUserListState createState() => _ChatUserListState();
}

class _ChatUserListState extends State<ChatUserList> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return ChatDetailPage(
            name: widget.text,
            image: widget.image,
          );
        }));
      },
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Row(
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: AssetImage(widget.image),
                      maxRadius: 30,
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      child: Container(
                        color: Colors.transparent,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(widget.text),
                            SizedBox(height: 8),
                            Text(
                              widget.secondaryText,
                              style: TextStyle(
                                  fontSize: 14, color: Colors.grey.shade500),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Text(
                widget.time,
                style: TextStyle(
                    fontSize: 12,
                    color: widget.isMessageReading
                        ? Colors.pink
                        : Colors.grey[500],
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}
