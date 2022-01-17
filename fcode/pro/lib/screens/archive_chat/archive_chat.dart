import 'package:flutter/material.dart';

class ArchiveChat extends StatefulWidget {
  @override
  _ArchiveChatState createState() => _ArchiveChatState();
}

class _ArchiveChatState extends State<ArchiveChat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF8EDEDFB),
      appBar: AppBar(
        backgroundColor: Color(0xFF8EDEDFB),
        centerTitle: true,
        title: Text(
          "Archived list",
          style: TextStyle(
            color: Color(0xFF464A64),
            fontSize: 16,
          ),
        ),
      ),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: _demoData.length,
        itemBuilder: (context, index){
          return Container(
            color: Color(0xff8ededfb),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
              //  padding: const EdgeInsets.only(bottom: 20,top:0.0),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: 55,
                    height: 55,
                    child: Stack(
                      children: <Widget>[
                        Container(
                          width: 55,
                          height: 55,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(18.0),
                                bottomRight: Radius.circular(18.0),
                                bottomLeft: Radius.circular(18.0),
                                topLeft: Radius.circular(18.0),
                              ),
                              shape: BoxShape.rectangle,
                              image: DecorationImage(
                                  image: AssetImage("images/person_2.jpg"),
                                  fit: BoxFit.cover)),
                        ),
                        Positioned(
                          top: 42,
                          left: 43,
                          child: Container(
                            width: 13,
                            height: 13,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10.0),
                                  bottomRight: Radius.circular(10.0),
                                  bottomLeft: Radius.circular(10.0),
                                  topLeft: Radius.circular(10.0),
                                ),
                                color: Color(0xffe64a19),
                                shape: BoxShape.rectangle,
                                border: Border.all(
                                    color: Color(0xFFFFFFFF),
                                    width: 1)),
                          ),
                        )
                      ],
                    ),
                  ),
                  // SizedBox(
                  //   width: 15,
                  // ),
                  Container(
                    //color: Colors.red,
                    // width: MediaQuery.of(context).size.width * 0.70,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          // width: MediaQuery.of(context).size.width * 0.75,
                          child: Text(
                            "Person Name",
                            //  conversationList[index]['time'],
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          //width: MediaQuery.of(context).size.width * 0.70,
                          child: Text(
                            "Hey man! this is a simple text, just ignore it.",
                            //  conversationList[index]['time'],
                            style: TextStyle(
                                fontSize: 15,
                                color: Color(0xFF000000).withOpacity(0.7)),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    //color: Colors.red,
                    // width: 55,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          width: 15,
                          height: 15,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10.0),
                                bottomRight: Radius.circular(10.0),
                                bottomLeft: Radius.circular(10.0),
                                topLeft: Radius.circular(10.0),
                              ),
                              color: Colors.purple,
                              shape: BoxShape.rectangle,
                              border: Border.all(color: Colors.purple, width: 3)),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.10,
                          child: Text(
                            "2:30pm",
                            //  conversationList[index]['time'],
                            style: TextStyle(
                                fontSize: 15,
                                color: Color(0xFF000000).withOpacity(0.7)),
                            overflow: TextOverflow.ellipsis,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      )
    );
  }
}

enum CallType { miss, dial, receive }

List<Map<String, dynamic>> _demoData = [
  {
    "type": CallType.dial,
    "name": "Sayed Main Uddin",
    "image": "images/person.png",
  },
  {
    "type": CallType.miss,
    "name": "Mis. Alexa",
    "image": "images/person_2.jpg",
  },
  {
    "type": CallType.receive,
    "name": "Sayed Newaz Prince",
    "image": "images/person.png",
  },
  {
    "type": CallType.receive,
    "name": "Sakib Hossen",
    "image": "images/person.png",
  },
  {
    "type": CallType.dial,
    "name": "Sayed Main Uddin",
    "image": "images/person.png",
  },
  {
    "type": CallType.dial,
    "name": "Sayed Main Uddin",
    "image": "images/person.png",
  },
  {
    "type": CallType.miss,
    "name": "Mis. Alexa",
    "image": "images/person_2.jpg",
  },
  {
    "type": CallType.miss,
    "name": "Mis. Alexa",
    "image": "images/person_2.jpg",
  },
  {
    "type": CallType.receive,
    "name": "Sayed Newaz Prince",
    "image": "images/person.png",
  },
  {
    "type": CallType.receive,
    "name": "Sayed Newaz Prince",
    "image": "images/person.png",
  },
  {
    "type": CallType.miss,
    "name": "Mis. Alexa",
    "image": "images/person_2.jpg",
  },
  {
    "type": CallType.miss,
    "name": "Mis. Alexa",
    "image": "images/person_2.jpg",
  }
];
