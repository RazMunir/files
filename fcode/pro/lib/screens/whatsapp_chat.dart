import 'package:flutter/material.dart';

class WhatsappChat extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Chat Item"),
        backgroundColor: Colors.lightGreen,
      ),
      body: new ChatItem(), //calling chat_item.dart
    );
  }
}

class ChatItem extends StatelessWidget{

  final leftSection = new Container(
    child: new CircleAvatar(
      backgroundImage: AssetImage("images/person.png"),
      backgroundColor: Colors.lightGreen,
      radius: 24.0,
    ),
  );

  final middleSection = new Expanded(
    child: new Container(
      padding: new EdgeInsets.only(left: 8.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          new Text("Name",
            style: new TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 16.0,
            ),),
          new Text("Hi whatsp?", style:
          new TextStyle(color: Colors.grey),),
        ],
      ),
    ),
  );

  final rightSection = new Container(
    child: new Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        new Text("9:50",
          style: new TextStyle(
              color: Colors.lightGreen,
              fontSize: 12.0),),
        new CircleAvatar(
          backgroundColor: Colors.lightGreen,
          radius: 10.0,
          child: new Text("2",
            style: new TextStyle(color: Colors.white,
                fontSize: 12.0),),
        )
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        height: MediaQuery.of(context).size.height/10,
        // color: Colors.red,
        child: new Row(
          children: <Widget>[
            leftSection,
            middleSection,
            rightSection
          ],
        ),
      ),
    );

  }

}