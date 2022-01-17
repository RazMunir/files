import 'package:flutter/material.dart';

class GroupCall extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _GroupCall();
  }
}

class _GroupCall extends State<GroupCall> {
  List<Map<String, dynamic>> demoData = [
    {
      "isCalling": false,
      "name": "User 1",
      "image": "images/person.png",
    },
    {
      "isCalling": true,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: GridView.builder(
          padding: EdgeInsets.zero,
          itemCount: demoData.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: demoData.length <= 4
                  ? 0.7
                  : demoData.length <= 6
                  ? 1
                  : 1.4
          ),
              // crossAxisCount: 2, childAspectRatio: 0.7),
          itemBuilder: (ctx, index) {
            return demoData[index]["isCalling"]
                ? UserCallingCard(
                    name: demoData[index]["name"],
                    img: demoData[index]["image"])
                : Image.asset(
                    demoData[index]['image'],
                    fit: BoxFit.cover,
                  );
          }),
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

class UserCallingCard extends StatelessWidget {
  final String name, img;

  const UserCallingCard({Key key, @required this.name, @required this.img})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color(0xFF091C40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(20),
              height: (MediaQuery.of(context).size.height / 100) * 15,
              width: (MediaQuery.of(context).size.height / 100) * 15,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    Colors.white.withOpacity(0.02),
                    Colors.white.withOpacity(0.05)
                  ],
                  stops: [.5, 1],
                ),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(100)),
                child: Image.asset(
                  img,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 10/100,),
            Text(
              name,
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            SizedBox(height: 5/100),
            Text(
              "Calling…",
              style: TextStyle(color: Colors.white60),
            )
          ],
        ));
  }
}
