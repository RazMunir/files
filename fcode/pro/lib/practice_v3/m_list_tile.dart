import 'package:flutter/material.dart';

class MListTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListTile(
        leading: Icon(Icons.keyboard, color: Colors.pinkAccent, size: 30),
        title: Text(
          "Hello",
          style: TextStyle(fontSize: 20),
        ),
        subtitle: Text(
          "Trip at night",
          style: TextStyle(letterSpacing: 1),
        ),
        trailing: Icon(
          Icons.wb_incandescent_sharp,
          color: Colors.pinkAccent,
          size: 30,
        ),
        tileColor: Colors.black12,
      ),
    );
  }
}
