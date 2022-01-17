import 'package:flutter/material.dart';

class AllStories extends StatefulWidget {
  @override
  _AllStoriesState createState() => _AllStoriesState();
}

class _AllStoriesState extends State<AllStories> {
  List<Map<String, dynamic>> storyList = [
    {"name": "Sousuke","img": "images/person.png"},
    {"name":"Ponyo", "img": "images/person_2.jpg"},
    {"name": "Sousuke","img": "images/person.png"},
    {"name": "Sousuke", "img": "images/person.png"},
    {"name":"Ponyo", "img": "images/person_2.jpg"},
    {"name":"Ponyo", "img": "images/person_2.jpg"},
    {"name": "Sousuke", "img": "images/person.png"},
    {"name": "Sousuke", "img": "images/person.png"},
    {"name":"Ponyo", "img": "images/person_2.jpg"},
    {"name": "Sousuke", "img": "images/person.png"},
    {"name":"Ponyo", "img": "images/person_2.jpg"},
    {"name": "Sousuke", "img": "images/person.png"},
    {"name": "Sousuke", "img": "images/person.png"},
    {"name":"Ponyo", "img": "images/person_2.jpg"},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(6),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: storyList.length,
        itemBuilder: (context, index){
          // return _buildStoryItem(index, storyList[index]["name"], storyList[index]["img"]);
          return Container(
            width: MediaQuery.of(context).size.width * 0.5,
            child: Stack(
              fit: StackFit.loose,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10, top: 20),
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
                        ? null
                        : DecorationImage(
                        image: AssetImage(storyList[index]["img"]),
                        fit: BoxFit.cover
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    margin: EdgeInsets.only(left: 10,bottom: 7),
                    child: Text(
                      (index == 0) ? "Add to Story" : storyList[index]["name"],
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w700
                      ),
                    ),
                  ),
                )
              ],
            ),
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.grey,
              image: DecorationImage(
                  image: AssetImage(storyList[index]["img"]),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Colors.grey.withOpacity(0.6), BlendMode.dstATop)
              ),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(7),
                  topRight: Radius.circular(7),
                  bottomLeft: Radius.circular(7),
                  bottomRight: Radius.circular(7)),
              border: Border.all(color: Colors.grey, width: 0.4),
            ),
          );
        },
      ),
    );
  }
}
