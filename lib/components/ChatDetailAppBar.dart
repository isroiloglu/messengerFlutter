import 'package:flutter/material.dart';
import 'package:messenger/modules/UserAccount.dart';

class ChatDetailAppBar extends StatelessWidget implements PreferredSizeWidget {
  String name;
  String image;

  ChatDetailAppBar({@required this.image, @required this.name});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.grey.shade200,
      flexibleSpace: SafeArea(
        child: GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return UserAccountPage(
                name: name,
                image: image,
              );
            }));
          },
          child: Container(
            padding: EdgeInsets.only(top: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                CircleAvatar(
                  backgroundImage: AssetImage(image),
                  maxRadius: 20,
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        name,
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 18),
                      ),
                      SizedBox(height: 6),
                      Text(
                        'online',
                        style:
                            TextStyle(color: Colors.greenAccent, fontSize: 14),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.more_vert,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
