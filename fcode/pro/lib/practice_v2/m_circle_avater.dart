import 'package:flutter/material.dart';

class MCircleAvatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Container(
              color: Colors.white,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://www.tutorialspoint.com/dart_programming/images/dart-programming-mini-logo.jpg"),
                    radius: 65.0,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              height: 450.0,
              color: Colors.white,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('images/camera.png'),
                    backgroundColor: Colors.red,
                    radius: 65.0,
                  ),
                  Image.asset('images/camera.png',),
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://www.tutorialspoint.com/dart_programming/images/dart-programming-mini-logo.jpg"),
                    radius: 65.0,
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
