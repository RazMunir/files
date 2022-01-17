import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

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

class MProfileScreenV2 extends StatefulWidget {
  @override
  _MProfileScreenV2 createState() {
    return _MProfileScreenV2();
  }
}

int bgColor = 0xFFF4F4F9;

class _MProfileScreenV2 extends State<MProfileScreenV2> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _secondPortion(),
        Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 10),
            child: Column(children: [
              InfoCard("Email", "example@gmail.com", Colors.black87,
                  Icons.alternate_email_rounded, () {}),
              _divider(),
              InfoCard("Mobile", "+880131406651", Colors.black87,
                  Icons.phone_outlined, () {}),
              _divider(),
              InfoCard("Location", "Chittagong, Bangladesh", Colors.black87,
                  Icons.location_on_outlined, () {}),
              _divider(),
              InfoCard("Birthday", "22 Feb, 1991", Colors.black87,
                  Icons.card_giftcard_outlined, () {}),
              _divider()
            ])),
        _thirdPortion("More Actions"),
        Container(
          margin: EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 10),
          child: Column(
            children: [
              InfoCard("Create group with Bronu", "", Colors.black87,
                  Icons.group_add_outlined, () {}),
              _divider(),
              InfoCard("Search in Conversation", "", Colors.black87,
                  Icons.search_outlined, () {}),
              _divider(),
              InfoCard("Delete Conversation", "", Colors.black87,
                  Icons.highlight_remove, () {}),
              _divider(),
              InfoCard("Block", "", Colors.redAccent, Icons.block, () {}),
              _divider()
            ],
          ),
        ),
        _thirdPortion("Shared Gallery"),
        Container(
            margin: EdgeInsets.only(left: 17, right: 20, top: 8, bottom: 12),
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
    );
  }

  Widget _secondPortion() {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 10, top: 25, bottom: 15),
      child: Row(
        children: [
          Text(
            "Personal Information",
            style: TextStyle(
              color: Colors.black,
              fontSize: 12,
            ),
          )
        ],
      ),
    );
  }

  Widget _thirdPortion(String name) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 10, top: 5, bottom: 5),
      child: Row(
        children: [
          Text(
            name,
            style: TextStyle(
              color: Colors.black,
              fontSize: 12,
            ),
          )
        ],
      ),
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

  static void showToast(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}

class InfoCard extends StatelessWidget {
  final String title;
  final String value;
  final Color color;
  final IconData icon;
  final Function onPressed;

  InfoCard(this.title, this.value, this.color, this.icon, this.onPressed);

  @override
  Widget build(BuildContext context) {
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
            Container(
              child: Text(
                value,
                style: TextStyle(color: Colors.black54, fontSize: 14),
              ),
            )
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
              _MProfileScreenV2.showToast("Show all");
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
            )
        )
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
