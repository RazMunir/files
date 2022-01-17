import 'package:flutter/material.dart';

class MChip extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Chip(
          label: Text("Chip"),
          avatar: CircleAvatar(
            backgroundColor: Colors.orange,
            child: Text("3"),
          ),
        ),
      ),
    );
  }

}