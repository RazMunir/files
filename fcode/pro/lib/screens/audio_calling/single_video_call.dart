import 'package:flutter/material.dart';
import 'package:flutter_profile_app/screens/login_system/forget_password.dart';

class SingleVideoCall extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _SingleVideoCall();
  }
}

class _SingleVideoCall extends State{

  double width = 100.0, height = 100.0;
  Offset position ;

  String person_1 = "images/person.png", person_2 = "images/person_2.jpg";

  @override
  void initState() {
    super.initState();
    position = Offset(0.0, height - 20);
    // position = Offset(0.0, 0.0);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      // fit: StackFit.expand,
      children: [
        Image.asset(
          person_1,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          fit: BoxFit.cover,
        ),
        Positioned(
          left: position.dx,
          top: position.dy,
          child: Draggable(
            child: senderImage(person_2),
            feedback: senderImage(person_2),
            onDraggableCanceled: (Velocity velocity, Offset offset){
              setState(() => position = offset);
            },
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RoundButton(
                  icon: Icons.mic_none_outlined,
                  press: (){},
                ),
                RoundButton(
                  icon: Icons.call_end_outlined,
                  bgColor: Colors.red,
                  press: (){},
                ),
                RoundButton(
                  icon: Icons.volume_up_sharp,
                  press: () {},
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget senderImage(String img){
    return GestureDetector(
      onTap: (){
        setState(() {
          if(person_1 == "images/person.png") {
            person_1 = "images/person_2.jpg";
            person_2 = "images/person.png";
          } else {
            person_1 = "images/person.png";
            person_2 = "images/person_2.jpg";
          }
        });
      },
      child: Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                //color: Colors.grey.withOpacity(.3),
                color: Colors.black26,
                offset: Offset(0,2),
                blurRadius: 6.0,
              ),
            ],
            image: DecorationImage(
              image: AssetImage(img),
              fit: BoxFit.cover,
            ),
          )
      ),
    );
  }
}

class RoundButton extends StatelessWidget{
  final IconData icon;
  final Color iconColor, bgColor;
  final VoidCallback press;


  RoundButton({this.icon, this.iconColor: Colors.white, this.bgColor: Colors.black, this.press});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(15.0),
        elevation: 5.0,
        primary: bgColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100.0),
        ),
      ),
      child: Icon(
        icon,
        color: iconColor,
        size: 30,
      ),
      onPressed: press,
    );
  }
}