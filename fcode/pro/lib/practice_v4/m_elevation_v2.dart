import 'package:flutter/material.dart';

class MElevationV2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Material(
          elevation: 20,
          child: Container(
            height: 40,
            width: double.infinity,
            margin: EdgeInsets.only(top: 10),
          ),
        ),
        Container(
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 2.0,
                  spreadRadius: 0.0,
                  offset: Offset(2.0, 2.0), // shadow direction: bottom right
                  // offset: Offset(-2.0, -2.0) // shadow direction: top left
                )
              ],
            ),
            child: Container(
                width: 100, height: 50) // child widget, replace with your own
            ),
        Material(
          elevation: 5,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(50)),
          child: Container(
            height: 100,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(50))),
          ),
        ),
      ],
    );
  }
}
