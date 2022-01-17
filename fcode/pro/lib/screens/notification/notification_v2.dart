import 'package:flutter/material.dart';

class NotificationPageV2 extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _NotificationPageV2();
  }
}

enum notificationTypes {friendRequest, birthday, story}

class _NotificationPageV2 extends State<NotificationPageV2>{
  List<Map<String, dynamic>> notificationList = [
    {
      "type": notificationTypes.friendRequest,
      "name": "Main Uddin",
      "time": "Friday at 1:36AM",
      "img": "images/person.png",
      "viewed": "yes"
    },
    {
      "type": notificationTypes.friendRequest,
      "name": "Joshep",
      "time": "Friday at 1:36AM",
      "img": "images/person_2.jpg",
      "viewed": "no"
    },
    {
      "type": notificationTypes.birthday,
      "name": "Sakib Hossen",
      "time": "2 hours ago",
      "img": "images/person.png",
      "viewed": "no"
    },
    {
      "type": notificationTypes.story,
      "name": "Jumon",
      "time": "2 hours ago",
      "img": "images/person.png",
      "viewed": "no"
    },
    {
      "type": notificationTypes.birthday,
      "name": "Sakib Hossen",
      "time": "Saturday at 2:00PM",
      "img": "images/person.png",
      "viewed": "yes"
    },
    {
      "type": notificationTypes.friendRequest,
      "name": "Main Uddin",
      "time": "Friday at 1:36AM",
      "img": "images/person.png",
      "viewed": "yes"
    },
    {
      "type": notificationTypes.friendRequest,
      "name": "Kenecholor",
      "time": "Friday at 1:36AM",
      "img": "images/person.png",
      "viewed": "no"
    },
    {
      "type": notificationTypes.birthday,
      "name": "Sakib Hossen",
      "time": "2 hours ago",
      "img": "images/person.png",
      "viewed": "no"
    },
    {
      "type": notificationTypes.story,
      "name": "Jumon",
      "time": "2 hours ago",
      "img": "images/person.png",
      "viewed": "no"
    },
    {
      "type": notificationTypes.birthday,
      "name": "Sakib Hossen",
      "time": "Saturday at 2:00PM",
      "img": "images/person.png",
      "viewed": "yes"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F4F9),
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Color(0xff607d8b)
        ),
        backgroundColor: Color(0xff8ededfb),
        title:  Text(
          "Notifications",
          style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold,
              color: Color(0xff607d8b)),
        ),
      ),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: notificationList.length,
        itemBuilder: (context, index){
          return _buildNotificationsItem(index);
        },
      ),
    );
  }

  _buildNotificationsItem(int index){
    return Container(
      child: ListTile(
        leading: Container(
          width: 50,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: CircleAvatar(
                  backgroundImage: AssetImage(notificationList[index]["img"]),
                  radius: 20.0,
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  width: 20,
                  child: CircleAvatar(
                    backgroundColor: Colors.lightBlue,
                    child: Icon(
                      (notificationList[index]["type"] == notificationTypes.friendRequest)
                          ? Icons.person_add_rounded
                          : (notificationList[index]["type"] == notificationTypes.birthday)
                          ? Icons.card_giftcard_outlined
                          : Icons.image,
                      size: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        title: (notificationList[index]["type"] == notificationTypes.friendRequest)
            ? RichText(
          text: TextSpan(
              children: [
                TextSpan(
                    text: notificationList[index]["name"],
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                    )
                ),
                TextSpan(
                    text: " sent you a friend request",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black87
                    )
                )
              ]
          ),
        )
            : (notificationList[index]["type"] == notificationTypes.birthday)
            ? RichText(
          text: TextSpan(
              children: [
                TextSpan(
                    text: "It's ",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black87
                    )
                ),
                TextSpan(
                    text: notificationList[index]["name"],
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                    )
                ),
                TextSpan(
                    text: "'s birthday today. let wish him!",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black87
                    )
                )
              ]
          ),
        )
            : RichText(
          text: TextSpan(
              children: [
                TextSpan(
                    text: notificationList[index]["name"],
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                    )
                ),
                TextSpan(
                    text: " add a new story, click to ",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black87
                    )
                ),
                TextSpan(
                    text: "View Story",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                    )
                ),
              ]
          ),
        ),
        subtitle: Text(
          notificationList[index]["time"],
          style: TextStyle(
              color: (notificationList[index]["viewed"] == "yes")
                  ? Colors.grey
                  : Colors.lightBlue
          ),
        ),
        trailing: Icon(Icons.more_horiz_outlined),
      ),
    );
  }
}