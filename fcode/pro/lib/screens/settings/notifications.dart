import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Notifications extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _Notifications();
  }
}

class _Notifications extends State<Notifications>{
  bool _isOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F4F9),
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Color(0xff607d8b),
        ),
        backgroundColor: Color(0xff8ededfb),
        title: Text(
          "Notifications",
          style: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.bold,
            color: Color(0xff607d8b)
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Turn on notification",
              style: TextStyle(
                fontSize: 16
              ),
            ),
            Transform.scale(
              scale: 0.9,
              child: CupertinoSwitch(
                value: _isOn,
                onChanged: (value){
                  setState(() {
                    _isOn = value;
                  });
                },
                activeColor: Color(0xff607d8b),
                trackColor: Colors.black12,
              ),
            )
          ],
        ),
      ),
    );
  }
}