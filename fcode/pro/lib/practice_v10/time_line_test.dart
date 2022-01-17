import 'package:flutter/material.dart';

class TimeLineTest extends StatefulWidget {
  @override
  _TimeLineTestState createState() => _TimeLineTestState();
}

class _TimeLineTestState extends State<TimeLineTest> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.white60,
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return new Stack(
            children: <Widget>[
              new Padding(
                padding: const EdgeInsets.only(left: 50.0),
                child: new Card(
                  margin: new EdgeInsets.all(10.0),
                  child: new Container(
                    width: double.infinity,
                    height: 200.0,
                    color: Color(0x8A5C6687),
                  ),
                ),
              ),
              new Positioned(
                top: 0.0,
                bottom: 0.0,
                left: 35.0,
                child: new Container(
                  height: double.infinity,
                  width: 3.0,
                  color: Colors.black26,
                ),
              ),
              new Positioned(
                top: 100.0,
                left: 15.0,
                child: new Container(
                  height: 40.0,
                  width: 40.0,
                  decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black87,
                  ),
                  child: new Container(
                    margin: new EdgeInsets.all(5.0),
                    height: 30.0,
                    width: 30.0,
                    decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        // color: Colors.black12
                    ),
                    child: Icon(Icons.alarm, color: Colors.white,size: 24,),
                  ),
                ),
              )
            ],
          );
        },
        itemCount: 5,
      ),
    );
  }
}
