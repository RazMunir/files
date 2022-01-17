import 'package:flutter/material.dart';

class MScrollView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Container(
            color: Colors.black12,
            height: 300,
          ),
          SizedBox(
            height: 300,
          ),
          Container(
            color: Colors.black12,
            height: 300,
          )
        ],
      ),
    );
  }

}