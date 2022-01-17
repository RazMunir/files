import 'package:flutter/material.dart';

class MScrollViewAppBar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.red,
          child: Row(
            children: [
              Text("Hello"),
            ],
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Text("Hello", style: TextStyle(fontSize: 20, backgroundColor: Colors.black12),),
                Text("Hello"),
                Text("Hello"),
                Text("Hello"),
                Text("Hello"),
                Text("Hello"),
                Text("Hello"),
                Text("Hello"),
                Text("Hello"),
                Text("Hello"),
                Text("Hello"),
                Text("Hello"),
                Text("Hello"),
                Text("Hello"),
                Text("Hello"),
                Text("Hello"),
                Text("Hello"),
                Text("Hello"),
                Text("Hello"),
                Text("Hello"),
                Text("Hello"),
                Text("Hello"),
                Text("Hello"),
                Text("Hello"),
                Text("Hello"),
                Text("Hello"),
                Text("Hello"),
                Text("Hello"),
                Text("Hello"),
                Text("Hello"),
                Text("Hello"),
                Text("Hello"),
                Text("Hello"),
                Text("Hello"),
                Text("Hello"),
                Text("Hello"),
                Text("Hello"),
                Text("Hello"),
                Text("Hello"),
                Text("Hello"),
                Text("Hello"),
                Text("Hello"),
                Text("Hello"),
                Text("Hello"),
                Text("Hello"),
                Text("Hello"),
                Text("Hello"),
                Text("Hello"),
                Text("Hello"),
                Text("Hello"),
                Text("Hello"),
                Text("Hello"),
                Text("Hello"),
                Text("Hello"),
                Text("Hello"),
                Text("Hello", style: TextStyle(fontSize: 20, backgroundColor: Colors.black12),),
              ],
            ),
          ),
        )
      ],
    );
  }
}