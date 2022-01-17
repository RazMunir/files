import 'package:flutter/material.dart';
import 'package:flutter_profile_app/practice/second_v2_logic.dart';

//organize code: how to call code from separate file
void main() {
  runApp(new Three());
}

class Three extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter App",
      home: SecondV2Logic(),
    );
  }
}
