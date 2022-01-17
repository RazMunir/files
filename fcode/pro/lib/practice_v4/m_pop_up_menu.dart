import 'package:flutter/material.dart';

class MPopUpMenu extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _MPopUpMenu();
  }
}

class _MPopUpMenu extends State<MPopUpMenu>{

  String selectedOption = "Male";

  static const List<String> options = [
    "Male",
    "Female"
  ];

  final List<PopupMenuItem> menuItems = options.map((value) => PopupMenuItem(
    value: value,
    child: Text(value),
  )).toList();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 0, right: 0, top: 12, bottom: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.videocam_outlined,
                      color: Colors.pinkAccent,
                      size: 20,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Text(
                        "title",
                        style: TextStyle(
                            // color:
                            // (color == Colors.redAccent) ? color : Colors.black,
                            fontSize: 14),
                      ),
                    )
                  ],
                ),
                Container(
                  child: Text(
                    "value",
                    style: TextStyle(color: Colors.black54, fontSize: 14),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 0, right: 0, top: 12, bottom: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.videocam_outlined,
                      color: Colors.pinkAccent,
                      size: 20,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Text(
                        "title",
                        style: TextStyle(
                          // color:
                          // (color == Colors.redAccent) ? color : Colors.black,
                            fontSize: 14),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      child: PopupMenuButton(
                        onSelected: (newValue) {
                          setState(() {
                            selectedOption = newValue;
                          });
                        },
                        // icon: Icon(Icons.arrow_drop_down),
                        child: Text(selectedOption),
                        itemBuilder: (context) {
                          return menuItems;
                        },
                      ),
                    ),
                    Icon(Icons.arrow_drop_down_sharp)
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}