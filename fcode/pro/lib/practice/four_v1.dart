import 'package:flutter/material.dart';
import 'package:flutter_profile_app/practice/three.dart';

void main() {
  runApp(new FourV1());
}

class FourV1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Flutter App",
        home: Scaffold(
          appBar: AppBar(title: Text("Practice Mode v1"),),
          body: Three(),
        )
    );
  }
}