import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class MSwitchButton extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _MSwitchButton();
  }
}

class _MSwitchButton extends State<MSwitchButton>{
  bool _isOn = false;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CupertinoSwitch(
        value: _isOn,
        onChanged: (value){
          setState(() {
            _isOn = value;
          });
          print("Switch: $_isOn");
        },
        activeColor: Colors.pinkAccent,
        trackColor: Colors.black26,
      ),
    );
  }
}