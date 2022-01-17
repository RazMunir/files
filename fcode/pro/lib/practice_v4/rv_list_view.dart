import 'package:flutter/material.dart';

class RvListView extends StatelessWidget {
  // List<String> imageList;
  List<Map<String, dynamic>> messages = [
    {"msg": "images/person.png"},
    {"msg": "images/person.png"},
    {"msg": "images/person.png"},
    {"msg": "images/person.png"},
    {"msg": "images/person.png"},
    {"msg": "images/person.png"},
    {"msg": "images/person.png"},
    {"msg": "images/person.png"},
    {"msg": "images/person.png"},
    {"msg": "images/person.png"},
    {"msg": "images/person.png"},
    {"msg": "images/person.png"},
    {"msg": "images/person.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: messages.length,
        itemBuilder: (ctx, index) {
          return ImageItem(messages[index]["msg"]);
        });
  }
}

class ImageItem extends StatelessWidget {
  final String image;

  ImageItem(this.image);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black26,
      child: Row(
        children: [
          Container(
            height: 60,
            width: 60,
            margin: EdgeInsets.all(3),
            decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(7),
                    topRight: Radius.circular(7),
                    bottomLeft: Radius.circular(7),
                    bottomRight: Radius.circular(7)),
                border: Border.all(color: Colors.grey, width: 0.4),
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                )),
          ),
          Text("Hello Bro..")
        ],
      ),
    );
  }
}
