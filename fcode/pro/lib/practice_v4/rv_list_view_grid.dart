import 'package:flutter/material.dart';

class RvListViewGrid extends StatelessWidget {
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
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: messages.length,
        itemBuilder: (ctx, index) {
          return ImageItem(messages[index]['msg']);
        });
  }
}

class ImageItem extends StatelessWidget {
  final String image;

  ImageItem(this.image);

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}