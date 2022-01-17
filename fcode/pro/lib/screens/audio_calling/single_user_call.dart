import 'package:flutter/material.dart';

class SingleUserCall extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SingleUserCall();
  }
}

class _SingleUserCall extends State<SingleUserCall> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          "images/person.png",
          fit: BoxFit.cover,
        ),
        DecoratedBox(
          decoration: BoxDecoration(color: Colors.black.withOpacity(0.3)),
        ),
        Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Jemmy \nWilliams",
                style: Theme.of(context)
                    .textTheme
                    .headline3
                    .copyWith(color: Colors.white),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Incoming 00:01".toUpperCase(),
                style: TextStyle(
                  color: Colors.white.withOpacity(0.6),
                ),
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 64,
                    width: 64,
                    child: TextButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(100)),
                            // side: BorderSide(color: Colors.red)
                          ),
                        ),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                        // padding: MaterialStateProperty.all(EdgeInsets.all(10))
                      ),
                      child: Icon(
                        Icons.mic_none_outlined,
                        color: Colors.black,
                        size: 30,
                      ),
                      onPressed: () {},
                    ),
                  ),
                  RoundButton(
                    icon: Icons.call_end_outlined,
                    press: () {},
                    bgColor: Colors.red,
                    iconColor: Colors.white,
                  ),
                  RoundButton(
                    icon: Icons.volume_up_sharp,
                    press: () {},
                  )
                ],
              )
            ],
          ),
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
      this.iconColor = Colors.black,
      this.bgColor = Colors.white,
      @required this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64,
      width: 64,
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
