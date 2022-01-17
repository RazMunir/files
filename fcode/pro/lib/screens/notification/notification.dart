import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _NotificationPage();
  }
}

enum notificationTypes {friendRequest, birthday, story}

class _NotificationPage extends State<NotificationPage>{
  List<Map<String, dynamic>> notificationList = [
    {
      "type": notificationTypes.friendRequest,
      "name": "Main Uddin",
      "time": "Friday at 1:36AM",
      "img": "images/person.png",
      "viewed": "yes"
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
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: ListTile(
            leading: Container(
              width: 50,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      backgroundImage: AssetImage("images/person.png"),
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
                          Icons.person_add,
                          size: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            title: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Main Uddin",
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
            ),
            subtitle: Text("Friday at 1:36AM"),
            trailing: Icon(Icons.more_horiz_outlined),
          ),
        ),
        Container(
          child: ListTile(
            leading: Container(
              width: 50,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      backgroundImage: AssetImage("images/person.png"),
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
                          Icons.card_giftcard_outlined,
                          size: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            title: RichText(
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
                        text: "Sakib Hossen",
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
            ),
            subtitle: Text("2 hours ago"),
            trailing: Icon(Icons.more_horiz_outlined),
          ),
        ),
        Container(
          child: ListTile(
            leading: Container(
              width: 50,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      backgroundImage: AssetImage("images/person.png"),
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
                          Icons.image,
                          size: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            title: RichText(
              text: TextSpan(
                  children: [
                    TextSpan(
                        text: "Jumon",
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
              "2 hours ago",
              style: TextStyle(
                color: Colors.lightBlue
              ),
            ),
            trailing: Icon(Icons.more_horiz_outlined),
          ),
        ),
      ],
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
                          : (notificationList[index]["type"] == notificationTypes.friendRequest)
                          ? Icons.card_giftcard_outlined
                          : Icons.image_outlined,
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
                    text: "Main Uddin",
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
                    text: "Sakib Hossen",
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
                    text: "Jumon",
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
          "2 hours ago",
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