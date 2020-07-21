import 'package:flutter/material.dart';
import 'package:messenger/components/ChatDetailAppBar.dart';
import 'package:messenger/components/chat_bubble.dart';
import 'package:messenger/models/chat_message.dart';
import 'package:messenger/models/send_menu_items.dart';

enum MessageType {
  sender,
  receiver,
}

class ChatDetailPage extends StatefulWidget {
  String name;
  String image;

  ChatDetailPage({@required this.image, @required this.name});

  @override
  _ChatDetailPageState createState() =>
      _ChatDetailPageState(name: name, image: image);
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  String name;
  String image;

  _ChatDetailPageState({@required this.image, @required this.name});

  String realMessage;
  final myController = TextEditingController();
  List<ChatMessage> chatMessage = [
    ChatMessage(type: MessageType.receiver, message: 'salom'),
  ];

  List<SendMenuItems> menuItems = [
    SendMenuItems(text: "Images", icons: Icons.image, color: Colors.yellow),
    SendMenuItems(text: "Music", icons: Icons.music_note, color: Colors.red),
    SendMenuItems(
        text: "Files", icons: Icons.insert_drive_file, color: Colors.purple),
    SendMenuItems(
        text: "Location", icons: Icons.location_on, color: Colors.orange),
    SendMenuItems(text: "Contants", icons: Icons.image, color: Colors.blue)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: ChatDetailAppBar(
        name: name,
        image: image,
      ),
      body: Stack(
        children: <Widget>[
          ListView.builder(
            padding: EdgeInsets.only(top: 10, bottom: 10),
            itemCount: chatMessage.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return ChatBubble(
                message: chatMessage[index],
              );
            },
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: EdgeInsets.only(left: 16, bottom: 10),
              height: 80,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Container(
                              height: MediaQuery.of(context).size.height,
                              color: Colors.grey[200],
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20))),
                                child: Column(
                                  children: <Widget>[
                                    SizedBox(height: 16),
                                    Center(
                                      child: Container(
                                          height: 4,
                                          width: 50,
                                          color: Colors.grey.shade400),
                                    ),
                                    SizedBox(height: 16),
                                    ListView.builder(
                                      itemCount: menuItems.length,
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10, bottom: 10),
                                          child: ListTile(
                                            leading: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                color: menuItems[index]
                                                    .color
                                                    .shade100,
                                              ),
                                              height: 50,
                                              width: 50,
                                              child: Icon(
                                                menuItems[index].icons,
                                                size: 20,
                                                color: menuItems[index]
                                                    .color
                                                    .shade400,
                                              ),
                                            ),
                                            title: Text(
                                              menuItems[index].text,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16),
                                            ),
                                          ),
                                        );
                                      },
                                    )
                                  ],
                                ),
                              ),
                            );
                          });
                    },
                    child: Container(
                      width: 40.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.circular(30)),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 21,
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: TextField(
                        controller: myController,
                        decoration: InputDecoration(
                            hintText: 'input text...',
                            hintStyle: TextStyle(color: Colors.grey.shade500),
                            border: InputBorder.none)),
                  ),
                ],
              ),
            ),
          ),
          Align(
              alignment: Alignment.bottomRight,
              child: Container(
                padding: EdgeInsets.only(right: 30, bottom: 50),
                child: FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      if (myController.text != '') {
                        chatMessage.add(ChatMessage(
                            type: MessageType.sender,
                            message: myController.text));
                      }
                      myController.text = '';
                    });
                  },
                  child: Icon(Icons.send),
                  backgroundColor: Colors.pink,
                ),
              ))
        ],
      ),
    );
  }
}
