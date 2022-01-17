import 'package:flutter/material.dart';

class AllStories extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _AllStories();
  }
}

class _AllStories extends State<AllStories>{
  List<Map<String, dynamic>> messages = [
    {"msg": "images/person.png"},
    {"msg": "images/person_2.jpg"},
    {"msg": "images/person.png"},
    {"msg": "images/person_2.jpg"},
    {"msg": "images/person_2.jpg"},
    {"msg": "images/person.png"},
    {"msg": "images/person.png"},
    {"msg": "images/person_2.jpg"},
    {"msg": "images/person.png"},
    {"msg": "images/person_2.jpg"},
    {"msg": "images/person.png"},
    {"msg": "images/person.png"},
    {"msg": "images/person_2.jpg"},
  ];

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.5,
          child: Stack(
            fit: StackFit.loose,
            children: [
              Container(
                margin: EdgeInsets.only(left: 20, top: 20),
                width: 50,
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25)
                  ),
                  border: Border.all(color: Colors.lightBlue, width: 2),
                  image: DecorationImage(
                    image: AssetImage("images/person.png"),
                    fit: BoxFit.cover
                  )
                ),
              ),
            ],
          ),
          margin: EdgeInsets.all(3),
          decoration: BoxDecoration(
            color: Colors.grey,
            image: DecorationImage(
                image: AssetImage("images/person.png"),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.grey.withOpacity(0.25), BlendMode.dstATop)),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(7),
                topRight: Radius.circular(7),
                bottomLeft: Radius.circular(7),
                bottomRight: Radius.circular(7)),
            border: Border.all(color: Colors.grey, width: 0.4),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.5,
          child: Stack(
            fit: StackFit.loose,
            children: [
              Container(
                margin: EdgeInsets.only(left: 20, top: 20),
                width: 50,
                height: 50,
                alignment: Alignment.center,
                child: Icon(
                  Icons.add,
                  size: 30,
                  color: Colors.black,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25)
                  ),
                  border: Border.all(color: Colors.lightBlue, width: 2),
                ),
              ),
            ],
          ),
          margin: EdgeInsets.all(3),
          decoration: BoxDecoration(
            color: Colors.grey,
            image: DecorationImage(
                image: AssetImage("images/person.png"),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.grey.withOpacity(0.25), BlendMode.dstATop)),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(7),
                topRight: Radius.circular(7),
                bottomLeft: Radius.circular(7),
                bottomRight: Radius.circular(7)),
            border: Border.all(color: Colors.grey, width: 0.4),
          ),
        )
      ],
    );
  }

  _buildStoryItem(int index, String image){
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      child: Stack(
        fit: StackFit.loose,
        children: [
          Container(
            margin: EdgeInsets.only(left: 20, top: 20),
            width: 50,
            height: 50,
            alignment: Alignment.center,
            child: (index == 0)
                ? Icon(
                    Icons.add,
                    size: 30,
                    color: Colors.black,
                  )
                : Container(),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25)
                ),
                border: Border.all(color: Colors.lightBlue, width: 2),
                image: (index == 0)
                    ? Container()
                    : DecorationImage(
                        image: AssetImage(image),
                        fit: BoxFit.cover
                      ),
            ),
          ),
        ],
      ),
      margin: EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: Colors.grey,
        image: DecorationImage(
            image: AssetImage("image"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.grey.withOpacity(0.25), BlendMode.dstATop)),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(7),
            topRight: Radius.circular(7),
            bottomLeft: Radius.circular(7),
            bottomRight: Radius.circular(7)),
        border: Border.all(color: Colors.grey, width: 0.4),
      ),
    );
  }
}