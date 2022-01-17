import 'package:flutter/material.dart';

class MText extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Hello Text",
        style: TextStyle(
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
          letterSpacing: 2.0,
          wordSpacing: 3.0,
          color: Colors.orange[50],
          fontFamily: 'Redressed'
        ),
      ),
    );
  }

}