import 'package:flutter/material.dart';

class GroupCallV2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _GroupCall();
  }
}

class _GroupCall extends State<GroupCallV2> {
  List<Map<String, dynamic>> demoData = [
    {
      "isCalling": false,
      "name": "User 1",
      "image": "images/person.png",
    },
    {
      "isCalling": false,
      "name": "Steve jon",
      "image": "images/person.png",
    },
    {
      "isCalling": false,
      "name": "User 1",
      "image": "images/person.png",
    },
    {
      "isCalling": false,
      "name": "User 1",
      "image": "images/person.png",
    },
    {
      "isCalling": false,
      "name": "User 1",
      "image": "images/person.png",
    },
    {
      "isCalling": false,
      "name": "User 1",
      "image": "images/person.png",
    },
    {
      "isCalling": false,
      "name": "User 1",
      "image": "images/person.png",
    },
    {
      "isCalling": false,
      "name": "User 1",
      "image": "images/person.png",
    },
    {
      "isCalling": false,
      "name": "User 1",
      "image": "images/person.png",
    },
    {
      "isCalling": false,
      "name": "User 1",
      "image": "images/person.png",
    },
    // {
    //   "isCalling": false,
    //   "name": "User 1",
    //   "image": "images/person.png",
    // },
    // {
    //   "isCalling": false,
    //   "name": "User 1",
    //   "image": "images/person.png",
    // },
  ];

  bool isOdd = false;
  int listLength;

  @override
  Widget build(BuildContext context) {
    listLength = demoData.length;
    if(listLength.isOdd){
      isOdd = true;
      listLength = listLength - 1;
    }
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: ListView(
        // shrinkWrap: false,
        // physics: NeverScrollableScrollPhysics(),
        children: [
          GridView.builder(
              padding: EdgeInsets.zero,
              itemCount: listLength,
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: demoData.length <= 4
                      ? 0.7
                      : demoData.length <= 6
                      ? 1
                      : 1.4
              ),
                  // crossAxisCount: 2, childAspectRatio: 0.7),
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (ctx, index) {
                return Container(
                  margin: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    borderRadius: new BorderRadius.all(Radius.circular(10.0)),
                    // border: new Border.all(color: Colors.orangeAccent),
                    image: DecorationImage(
                      image: Image.asset(demoData[index]['image']).image,
                      fit: BoxFit.cover
                    )
                  ),
                );
              }),
          isOdd == true
              ? AspectRatio(
                  aspectRatio: 1.1,
                  child: Container(
                    margin: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                        borderRadius: new BorderRadius.all(Radius.circular(10.0)),
                        image: DecorationImage(
                          image: Image.asset(demoData[listLength]['image']).image,
                          fit: BoxFit.cover
                        )
                    ),
                  ),
                )
              : Container()
        ],
      ),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: Icon(
          Icons.keyboard_backspace_outlined,
          color: Color(0xFF091C40),
        ),
        onPressed: () {},
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.person_add_alt_1_outlined,
            color: Color(0xFF091C40),
          ),
          onPressed: () {},
        )
      ],
    );
  }

  Container buildBottomNavigationBar() {
    return Container(
      color: Color(0xFF091C40),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              RoundButton(
                icon: Icons.call_end_outlined,
                bgColor: Colors.red,
                press: () {},
              ),
              Spacer(
                flex: 3,
              ),
              RoundButton(
                icon: Icons.volume_up_sharp,
                press: () {},
              ),
              Spacer(),
              RoundButton(
                icon: Icons.mic_none_outlined,
                press: () {},
              ),
              Spacer(),
              RoundButton(
                icon: Icons.videocam_outlined,
                press: () {},
              ),
              Spacer(),
              RoundButton(
                icon: Icons.repeat,
                press: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}

class RoundButton extends StatelessWidget {
  final IconData icon;
  final Color iconColor, bgColor;
  final VoidCallback press;

  const RoundButton(
      {Key key,
      @required this.icon,
      this.iconColor = Colors.white,
      this.bgColor = const Color(0xFF2C384D),
      @required this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      width: 48,
      child: TextButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(100)),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(bgColor),
        ),
        child: Icon(
          icon,
          color: iconColor,
          size: 30,
        ),
        onPressed: press,
      ),
    );
  }
}
