import 'package:flutter/material.dart';

class ChatScreenDDV2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ChatScreenDDV2();
  }
}

class _ChatScreenDDV2 extends State<ChatScreenDDV2> {
  bool isRecentChatVisible = false, isFavouriteChatVisible = false;

  List<Map<String, dynamic>> recentUsers = [
    {"name": "Mr. Jhon Smith", "img": "images/person.png"},
    {"name": "Mr. Jhon Smith", "img": "images/person.png"},
    {"name": "Mr. Jhon Smith", "img": "images/person.png"},
    {"name": "Mr. Jhon Smith", "img": "images/person.png"},
    {"name": "Mr. Jhon Smith", "img": "images/person.png"},
    {"name": "Mr. Jhon Smith", "img": "images/person.png"},
    {"name": "Mr. Jhon Smith", "img": "images/person.png"},
    {"name": "Mr. Jhon Smith", "img": "images/person.png"},
    {"name": "Mr. Jhon Smith", "img": "images/person.png"},
    {"name": "Mr. Jhon Smith", "img": "images/person.png"},
    {"name": "Mr. Jhon Smith", "img": "images/person.png"},
    {"name": "Mr. Jhon Smith", "img": "images/person.png"},
    {"name": "Mr. Jhon Smith", "img": "images/person.png"},
    {"name": "Mr. Jhon Smith", "img": "images/person.png"},
    {"name": "Mr. Jhon Smith", "img": "images/person.png"}
  ];

  List<Map<String, dynamic>> favouriteUsers = [
    {"name": "Mr. Jhon Smith", "img": "images/person.png"},
    {"name": "Mr. Jhon Smith", "img": "images/person.png"},
    {"name": "Mr. Jhon Smith", "img": "images/person.png"},
    {"name": "Mr. Jhon Smith", "img": "images/person.png"},
    {"name": "Mr. Jhon Smith", "img": "images/person.png"},
    {"name": "Mr. Jhon Smith", "img": "images/person.png"},
    {"name": "Mr. Jhon Smith", "img": "images/person.png"},
    {"name": "Mr. Jhon Smith", "img": "images/person.png"},
    {"name": "Mr. Jhon Smith", "img": "images/person.png"},
    {"name": "Mr. Jhon Smith", "img": "images/person.png"},
    {"name": "Mr. Jhon Smith", "img": "images/person.png"},
    {"name": "Mr. Jhon Smith", "img": "images/person.png"},
    {"name": "Mr. Jhon Smith", "img": "images/person.png"},
    {"name": "Mr. Jhon Smith", "img": "images/person.png"},
    {"name": "Mr. Jhon Smith", "img": "images/person.png"}
  ];

  void changeRecentChatVisibility() {
    setState(() {
      isRecentChatVisible = !isRecentChatVisible;
    });
  }

  void changeFavouriteChatVisibility() {
    setState(() {
      isFavouriteChatVisible = !isFavouriteChatVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: changeFavouriteChatVisibility,
          child: Container(
            padding: EdgeInsets.all(5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Favourite Chats",
                  style: TextStyle(fontSize: 14),
                ),
                isFavouriteChatVisible
                    ? Icon(Icons.keyboard_arrow_up_rounded)
                    : Icon(Icons.keyboard_arrow_down_rounded)
              ],
            ),
          ),
        ),
        isFavouriteChatVisible
            ? Container(
                height: 150,
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: favouriteUsers.length,
                    itemBuilder: (ctx, index) {
                      return singleUser(favouriteUsers[index]["name"],
                          favouriteUsers[index]["img"]);
                    }),
              )
            : Container(),
        InkWell(
          onTap: changeRecentChatVisibility,
          child: Container(
            padding: EdgeInsets.all(5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Recent Chats",
                  style: TextStyle(fontSize: 14),
                ),
                isRecentChatVisible
                    ? Icon(Icons.keyboard_arrow_up_rounded)
                    : Icon(Icons.keyboard_arrow_down_rounded)
              ],
            ),
          ),
        ),
        isRecentChatVisible
            ? Container(
                height: 150,
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: recentUsers.length,
                    itemBuilder: (ctx, index) {
                      return singleUser(recentUsers[index]["name"],
                          recentUsers[index]["img"]);
                    }),
              )
            : Container(),
      ],
    );
  }

  Widget singleUser(String name, String img) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            style: TextStyle(fontSize: 13),
          ),
          CircleAvatar(
            backgroundImage: AssetImage(img),
            backgroundColor: Colors.red,
            radius: 15.0,
          ),
        ],
      ),
    );
  }
}
