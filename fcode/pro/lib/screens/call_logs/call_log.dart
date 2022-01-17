import 'package:flutter/material.dart';

class CallLog extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _CallLog();
  }
}

class _CallLog extends State<CallLog>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF8EDEDFB),
      appBar: AppBar(
        backgroundColor: Color(0xFF8EDEDFB),
        centerTitle: true,
        title: Text(
          "Call Logs",
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
          return itemCalling(index);
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.add_call),
      ),
    );
  }

  Widget itemCalling(int index){
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage(_demoData[index]["image"]),
            radius: 23,
            backgroundColor: Colors.blueGrey[200],
          ),
          title: Text("Hello Main", style: TextStyle(color: Color(0xFF464A64)),),
          trailing: SizedBox(
            width: 100.0,
            // height: 20,
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.call, color: Color(0xFF8C93C7),),
                  onPressed: (){},
                  tooltip: "Video Calling",
                ),
                IconButton(
                  icon: Icon(Icons.videocam, color: Color(0xFF8C93C7),),
                  onPressed: (){},
                  tooltip: "Audio Calling",
                ),
              ],
            ),
          ),
          subtitle: Row(
            children: [
              Icon(
                _demoData[index]["type"] == CallType.receive
                    ? Icons.phone_callback
                    : _demoData[index]["type"] == CallType.dial
                    ? Icons.phone_forwarded_outlined
                    : Icons.phone_missed_outlined,
                size: 14,),
              SizedBox(width: 2,),
              Text("Yesterday at 3:26 PM")
            ],
          ),
        ),
        Row(
          children: [
            Container(color: Colors.transparent, width: MediaQuery.of(context).size.width*0.1, height: .5,),
            Container(color: Color(0xFF8C93C7), width: MediaQuery.of(context).size.width*0.9, height: .5,),
          ],
        ),
        // Divider()
      ],
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
  },
];