import 'package:flutter/material.dart';
import 'package:messenger/components/chat.dart';
import 'package:messenger/models/ChatUsers.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatUsers> chatusers = [
    ChatUsers(
        text: 'Qandiyor',
        secondaryText: 'assalomu aleykum',
        image: 'assets/qandi.jpg',
        time: 'now'),
    ChatUsers(
        text: 'Muxa',
        secondaryText: 'music',
        image: 'assets/muhammadali.jpg',
        time: '11:04'),
    ChatUsers(
        text: 'Sherka',
        secondaryText: 'qayerdasan?',
        image: 'assets/sherka.jpg',
        time: '9:34'),
    ChatUsers(
        text: 'Shodiyev',
        secondaryText: 'B ni narxi qancha ekan ?',
        image: 'assets/shoxi.jpg',
        time: 'now'),
    ChatUsers(
        text: 'Telegram',
        secondaryText: 'Dear Isroiloglu , your....',
        image: 'assets/telegram.jpg',
        time: '10:00'),
    ChatUsers(
        text: 'Qandiyor',
        secondaryText: 'assalomu aleykum',
        image: 'assets/qandi.jpg',
        time: 'now'),
    ChatUsers(
        text: 'Muxa',
        secondaryText: 'music',
        image: 'assets/muhammadali.jpg',
        time: '11:04'),
    ChatUsers(
        text: 'Sherka',
        secondaryText: 'qayerdasan?',
        image: 'assets/sherka.jpg',
        time: '9:34'),
    ChatUsers(
        text: 'Shodiyev',
        secondaryText: 'B ni narxi qancha ekan ?',
        image: 'assets/shoxi.jpg',
        time: 'now'),
    ChatUsers(
        text: 'Telegram',
        secondaryText: 'Dear Isroiloglu , your....',
        image: 'assets/telegram.jpg',
        time: '10:00'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SafeArea(
              child: Padding(
                padding: EdgeInsets.only(left: 16, right: 16, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Chats',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                    Container(
                        height: 30,
                        child: Container(
                          padding: EdgeInsets.fromLTRB(8, 2, 8, 2),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.pink[50],
                          ),
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.add,
                                color: Colors.pink.shade100,
                              ),
                              Text(
                                'new',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ))
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search...',
                  hintStyle: TextStyle(color: Colors.grey.shade400),
                  prefixIcon:
                      Icon(Icons.search, color: Colors.grey.shade400, size: 20),
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  contentPadding: EdgeInsets.all(8),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.grey.shade100)),
                ),
              ),
            ),
            ListView.builder(
              itemCount: chatusers.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, int index) {
                return ChatUserList(
                  text: chatusers[index].text,
                  secondaryText: chatusers[index].secondaryText,
                  image: chatusers[index].image,
                  time: chatusers[index].time,
                  isMessageReading: (index == 1 || index == 3) ? true : false,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
