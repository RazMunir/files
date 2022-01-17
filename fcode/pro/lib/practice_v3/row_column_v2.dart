import 'package:flutter/material.dart';

class RowColumnV2 extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 3,
          child: Container(
            color: Colors.pinkAccent,
            child: Text(
              'Forget \nPassword',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 4,
          child: Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.lightBlueAccent,
            child: Text(
              'Forget \nPassword',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            color: Colors.pinkAccent,
            alignment: Alignment.center,
            child: Text(
              'Forget \nPassword',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        )
      ],
    );
  }
}