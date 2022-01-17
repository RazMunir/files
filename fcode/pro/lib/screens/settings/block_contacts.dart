import 'package:flutter/material.dart';
import 'package:flutter_profile_app/screens/group_create/add_member.dart';

class BlockContacts extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _BlockContacts();
  }
}

class _BlockContacts extends State<BlockContacts>{
  List<ChatModel> contacts = [
    ChatModel(name: "Main uddin", status: "A full stack developer"),
    ChatModel(name: "Jumon", status: "Nodejs Developer..........."),
    ChatModel(name: "Sakib", status: "Web developer..."),
    ChatModel(name: "Munir Khan", status: "Flutter Developer....."),
    ChatModel(name: "Somsher", status: "Raect developer.."),
    ChatModel(name: "Kenecholor", status: "Full Stack Web"),
    ChatModel(name: "Testing1", status: "Example work"),
    ChatModel(name: "Testing2", status: "Sharing is caring"),
    ChatModel(name: "Bilai", status: "....."),
    ChatModel(name: "Helper", status: "Love you Mom Dad"),
    ChatModel(name: "Tester", status: "I find the bugs"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F4F9),
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Color(0xff607d8b),
        ),
        backgroundColor: Color(0xff8ededfb),
        title: Text(
          "Blocked Contacts",
          style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold,
              color: Color(0xff607d8b)
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index){
          return ListTile(
            leading: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(18.0),
                    bottomRight: Radius.circular(18.0),
                    bottomLeft: Radius.circular(18.0),
                    topLeft: Radius.circular(18.0),
                  ),
                  shape: BoxShape.rectangle,
                  image: DecorationImage(
                      image: AssetImage(
                        "images/person.png",
                      ),
                      fit: BoxFit.cover)),
            ),
            title: Text(
                contacts[index].name
            ),
            subtitle: Text(
              contacts[index].status
            ),
            trailing: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(5.0),
                elevation: 2.0,
                primary: Color(0xff607d8b),
                shadowColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7.0),
                ),
              ),
              onPressed: () => print('Unblock Button Pressed'),
              // color: Colors.white,
              child: Text(
                'Unblock',
                style: TextStyle(
                  color: Color(0xFFCBC8E5),
                  letterSpacing: 1.5,
                  fontSize: 12.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
