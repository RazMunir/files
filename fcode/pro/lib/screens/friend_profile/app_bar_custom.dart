import 'package:flutter/material.dart';
import 'file:///E:/FlutterProjects/flutter_profile_app/lib/screens/friend_profile/m_profile_screen_v2.dart';

const int iconColor = 0xFF8C93C7;
var color = [
  {'icon': 0xFF8C93C7},
  {'barBg': 0xFF8EDEDFB},
  {'text': 0xFF464A64},
  {'barShadow': 0xFFA5A3D1},
  {'bg': 0xFFF4F4F9},
  {'iconBelow': 0xFF464A65},
  {'iconBg': 0xFFCBC8E5},
];

class AppBarCustom extends StatefulWidget {
  @override
  _AppBarCustom createState() {
    return _AppBarCustom();
  }
}

class _AppBarCustom extends State<AppBarCustom> {
  bool isExpanded = false;

  void changeExpandedState() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(color.elementAt(4).values.first),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              // height: 70.0,
              margin: EdgeInsets.only(bottom: 1.0),
              padding: EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0.0),
                color: Color(color.elementAt(1).values.first),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 1.0),
                    blurRadius: 1.0,
                  ),
                ],
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      padding: EdgeInsets.only(top: 25, left: 10),
                      child: Icon(
                        Icons.arrow_back_ios_outlined,
                        size: 22,
                        color: Color(color.elementAt(0).values.first),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Column(
                      children: [
                        Container(
                          child: InkWell(
                            onTap: changeExpandedState,
                            child: Container(
                              width: 60,
                              height: 65,
                              // margin: EdgeInsets.only(top: 5),
                              decoration: BoxDecoration(
                                  color: Colors.white70,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                      bottomLeft: Radius.circular(20),
                                      bottomRight: Radius.circular(20)),
                                  border: Border.all(
                                      color: Colors.grey, width: 0.4),
                                  image: DecorationImage(
                                    image: AssetImage('images/person.png'),
                                    fit: BoxFit.cover,
                                  )),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 8),
                          child: InkWell(
                            onTap: changeExpandedState,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  // color: Colors.red,
                                  child: Text(
                                    "Bronu Marse",
                                    style: TextStyle(
                                        color: Color(
                                            color.elementAt(2).values.first),
                                        fontSize: 14),
                                  ),
                                ),
                                Container(
                                  // color: Colors.red,
                                  margin: EdgeInsets.only(left: 5),
                                  child: Icon(
                                    isExpanded
                                        ? Icons.keyboard_arrow_up_outlined
                                        : Icons.keyboard_arrow_down_outlined,
                                    color: Color(color.elementAt(0).values.first),
                                    size: 22,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          child: !isExpanded
                              ? Container()
                              : Container(
                            margin: EdgeInsets.only(top: 8),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  child: Container(
                                    width: 32,
                                    height: 30,
                                    child: Icon(Icons.call,
                                        size: 20,
                                        color: Color(color
                                            .elementAt(5)
                                            .values
                                            .first)),
                                    decoration: BoxDecoration(
                                      color: Color(color
                                          .elementAt(6)
                                          .values
                                          .first),
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(12),
                                          topRight: Radius.circular(12),
                                          bottomLeft: Radius.circular(12),
                                          bottomRight:
                                          Radius.circular(12)),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 20),
                                  child: Container(
                                    width: 32,
                                    height: 30,
                                    child: Icon(Icons.videocam_rounded,
                                        size: 20,
                                        color: Color(color
                                            .elementAt(5)
                                            .values
                                            .first)),
                                    decoration: BoxDecoration(
                                      color: Color(color
                                          .elementAt(6)
                                          .values
                                          .first),
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(12),
                                          topRight: Radius.circular(12),
                                          bottomLeft: Radius.circular(12),
                                          bottomRight:
                                          Radius.circular(12)),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 20),
                                  child: Container(
                                    width: 32,
                                    height: 30,
                                    child: Icon(Icons.add_alert,
                                        size: 20,
                                        color: Color(color
                                            .elementAt(5)
                                            .values
                                            .first)),
                                    decoration: BoxDecoration(
                                      color: Color(color
                                          .elementAt(6)
                                          .values
                                          .first),
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(12),
                                          topRight: Radius.circular(12),
                                          bottomLeft: Radius.circular(12),
                                          bottomRight:
                                          Radius.circular(12)),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 20),
                                  child: Container(
                                    width: 32,
                                    height: 30,
                                    child: Icon(Icons.share_outlined,
                                        size: 20,
                                        color: Color(color
                                            .elementAt(5)
                                            .values
                                            .first)),
                                    decoration: BoxDecoration(
                                      color: Color(color
                                          .elementAt(6)
                                          .values
                                          .first),
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(12),
                                          topRight: Radius.circular(12),
                                          bottomLeft: Radius.circular(12),
                                          bottomRight:
                                          Radius.circular(12)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            MProfileScreenV2()
          ],
        ),
      ),
    );
  }
}