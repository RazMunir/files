import 'package:flutter/material.dart';

class MBottomNavBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MBottomNavBar();
  }
}

class _MBottomNavBar extends State<MBottomNavBar> {
  int tabSelected = 0;

  void changeTabSelection(int index) {
    setState(() {
      tabSelected = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Container(
        color: Colors.white,
        child: Center(
          child: tabWiseWidget(),
        ),
      ),
      bottomNavigationBar: buildBottomNavBar(),
    );
  }

  Widget tabWiseWidget() {
    switch (tabSelected) {
      case 0:
        return Text(
          "Page 1",
          style: TextStyle(fontSize: 20),
        );
      case 1:
        return Text(
          "Page 2",
          style: TextStyle(fontSize: 20),
        );
      case 2:
        return Text(
          "Page 3",
          style: TextStyle(fontSize: 20),
        );
      case 3:
        return Text(
          "Page 4",
          style: TextStyle(fontSize: 20),
        );
      case 4:
        return Text(
          "Page 5",
          style: TextStyle(fontSize: 20),
        );
      default:
        return Container();
    }
  }

  Container buildBottomNavBar() {
    return Container(
      // color: Color(0xFF091C40),
      color: Color(0xFF091C40),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            RoundButton(
                icon: Icons.call_end,
                bgColor: Colors.red,
                press: () {
                  changeTabSelection(0);
                }),
            Spacer(
              flex: 3,
            ),
            RoundButton(
                icon: Icons.call_end,
                press: () {
                  changeTabSelection(1);
                }),
            Spacer(),
            RoundButton(
                icon: Icons.call_end,
                press: () {
                  changeTabSelection(2);
                }),
            Spacer(),
            RoundButton(
                icon: Icons.call_end,
                press: () {
                  changeTabSelection(3);
                }),
            Spacer(),
            RoundButton(
                icon: Icons.call_end,
                press: () {
                  changeTabSelection(4);
                }),
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: Icon(
          Icons.keyboard_backspace_rounded,
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
