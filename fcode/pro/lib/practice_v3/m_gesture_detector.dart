import 'package:flutter/material.dart';

class MGestureDetector extends StatefulWidget {
  @override
  _MGestureDtector createState() {
    return _MGestureDtector();
  }
}

class _MGestureDtector extends State<MGestureDetector> {

  bool _status = true;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              child: Icon(Icons.edit,),
              onTap: () {
                setState(() {
                  _status = !_status;
                });
                debugPrint("$_status");
              },
            ),
            _status ? Icon(Icons.access_alarm) : Container()
          ],
        ),
      ),
    );
  }


}