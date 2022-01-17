import 'package:flutter/material.dart';

class ReusableCodeHelper extends StatelessWidget {

  final String text;
  final IconData icon;
  Function onPressed;


  ReusableCodeHelper(this.text, this.icon, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.only(left: 20, right: 10, top: 0, bottom: 10),
        child: Row(
          children: [
            CircleAvatar(
              child: Icon(
                icon,
                color: Colors.white,
              ),
              backgroundColor: Colors.black,
              radius: 18,
            ),
            Container(
              margin: EdgeInsets.only(left: 15),
              child: Text(
                text,
                style: TextStyle(color: Colors.black, fontSize: 14),
              ),
            )
          ],
        ),
      ),
    );
  }
}
