import 'package:flutter/material.dart';
import 'package:flutter_profile_app/practice/four.dart';

void main() {
  runApp(new Five());
}

class Five extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Flutter App",
        home: Four()
    );
  }
}