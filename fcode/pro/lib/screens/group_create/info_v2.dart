import 'package:flutter/material.dart';
import 'package:flutter_profile_app/screens/group_create/add_new_member.dart';
import 'package:flutter_profile_app/screens/group_create/block_a_member.dart';
import 'package:flutter_profile_app/screens/group_create/chat_screen.dart';
import 'package:flutter_profile_app/screens/group_create/add_member.dart';
import 'package:flutter_profile_app/screens/group_create/member_info.dart';

var color = [
  {'icon': 0xFF8C93C7},
  {'barBg': 0xFF8EDEDFB},
  {'text': 0xFF464A64},
  {'barShadow': 0xFFA5A3D1},
  {'bg': 0xFFF4F4F9},
  {'iconBelow': 0xFF464A65},
  {'iconBg': 0xFFCBC8E5},
];

class GroupInfoV2 extends StatefulWidget {
  final List<ChatModel> groupMemberList;

  GroupInfoV2({this.groupMemberList});

  @override
  State<StatefulWidget> createState() {
    return _GroupInfoV2();
  }
}

class _GroupInfoV2 extends State<GroupInfoV2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff8ededfb),
        leading: InkWell(
          child: Icon(
            Icons.arrow_back,
            color: Color(0xff607d8b),
            size: 26,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Group Info",
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xff607d8b)),
        ),
        actions: [
          TextButton(
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //       builder: (context) => ChatScreen(
              //             groupMemberList: widget.groupMemberList,
              //           )),
              // );
            },
            child: Icon(Icons.more_vert_outlined),
          )
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              _infoCard(
                  "Member Info", Colors.black87, Icons.card_membership, false,
                  () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MemberInfo(
                            groupMemberList: widget.groupMemberList,
                          )
                  ),
                );
              }),
              _divider(),
              _infoCard("Add Members", Colors.black87,
                  Icons.person_add_outlined, false, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddNewMember()),
                );
              }),
              _divider(),
              _infoCard(
                  "Block a Member", Colors.black87, Icons.block, false, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BlockAMember(
                        groupMemberList: widget.groupMemberList,
                      )
                  ),
                );
              }),
              _divider(),
              _infoCard("Leave Group", Colors.redAccent,
                  Icons.exit_to_app_outlined, false, () {}),
              _divider(),
              _infoCard("Shared Gallery", Colors.black87, Icons.image_outlined,
                  false, () {}),
              Container(
                  margin:
                      EdgeInsets.only(left: 17, right: 20, top: 8, bottom: 12),
                  child: GridView.builder(
                      // itemCount: messages.length,
                      itemCount: (messages.length > 6) ? 6 : messages.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                      ),
                      itemBuilder: (ctx, index) {
                        return ImageItem(messages[index]['msg'], index);
                      })),
            ],
          ),
        ),
      ),
      // ),
    );
  }

  Widget _divider() {
    return SizedBox(
      height: 1.5,
      child: Container(
        color: Colors.white,
      ),
      // color: Colors.white,
    );
  }

  Widget _infoCard(String title, Color color, IconData icon, bool isEnabled,
      Function onPressed) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.only(left: 0, right: 0, top: 12, bottom: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  icon,
                  color: color,
                  size: 20,
                ),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text(
                    title,
                    style: TextStyle(
                        color:
                            (color == Colors.redAccent) ? color : Colors.black,
                        fontSize: 14),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class ImageItem extends StatelessWidget {
  final String image;
  final int index;
  BuildContext context;

  ImageItem(this.image, this.index);

  Widget imageDialog() {
    return Dialog(
      child: Container(
        height: 400,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image:
                    DecorationImage(image: AssetImage(image), fit: BoxFit.fill),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: InkWell(
                onTap: () {
                  Navigator.pop(context, true);
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Icon(Icons.clear),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 1.0), //(x,y)
                        blurRadius: 6.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return (index == 5)
        ? InkWell(
            onTap: () {
              print("Show all");
            },
            child: Container(
              child: Center(
                child: Icon(
                  Icons.add,
                  size: 30,
                  color: Colors.black,
                ),
              ),
              margin: EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: Colors.grey,
                image: DecorationImage(
                    image: AssetImage(image),
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
            ))
        : InkWell(
            onTap: () {
              showDialog(
                  context: context,
                  barrierDismissible: true,
                  builder: (_) {
                    this.context = context;
                    return imageDialog();
                  });
            },
            child: Container(
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
          );
  }
}

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
