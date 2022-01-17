import 'package:flutter/material.dart';

class DialCall extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DialCall();
  }
}

class _DialCall extends State<DialCall> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF091C40),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Container(),
            Text(
              "Anna williams",
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  .copyWith(color: Colors.white),
            ),
            Text(
              "Calling…",
              style: TextStyle(color: Colors.white60),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.all(30),
              height: (MediaQuery.of(context).size.height / 100) * 25,
              width: (MediaQuery.of(context).size.height / 100) * 25,
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
                  "images/person.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Spacer(),
            Wrap(
              direction: Axis.horizontal,
              alignment: WrapAlignment.spaceBetween,
              children: [
                DialButton(
                  icon: Icons.mic_none_outlined,
                  name: "Audio",
                  press: (){},
                ),
                DialButton(
                  icon: Icons.volume_up_sharp,
                  name: "Microphone",
                  press: (){},
                ),
                DialButton(
                  icon: Icons.videocam_outlined,
                  name: "Video",
                  press: (){},
                ),
                DialButton(
                  icon: Icons.messenger_outline,
                  name: "Message",
                  press: (){},
                ),
                DialButton(
                  icon: Icons.person_add_outlined,
                  name: "Add contact",
                  press: (){},
                ),
                DialButton(
                  icon: Icons.voicemail_outlined,
                  name: "Voice mail",
                  press: (){},
                ),
              ],
            ),
            SizedBox(height: 5,),
            RoundButton(
              icon: Icons.call_end_outlined,
              press: () {},
              bgColor: Colors.red,
              iconColor: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}

class DialButton extends StatelessWidget{

  final IconData icon;
  final String name;
  final VoidCallback press;

  const DialButton({Key key, this.icon, this.name, this.press}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (MediaQuery.of(context).size.height / 100) * 15,
      child: TextButton(
        onPressed: press,
        style: ButtonStyle(
            padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 20))
        ),
        child: Column(
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: 36,
            ),
            SizedBox( height: 5,),
            Text(
              name,
              style: TextStyle(
                color: Colors.white,
                fontSize: 13,
              ),
            )
          ],
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
        this.iconColor = Colors.black,
        this.bgColor = Colors.white,
        @required this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 54,
      width: 54,
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
          size: 28,
        ),
        onPressed: press,
      ),
    );
  }
}
