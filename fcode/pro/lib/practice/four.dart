import 'package:flutter/material.dart';
import 'package:flutter_profile_app/practice/three.dart';

void main() {
  runApp(new Four());
}

class Four extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Flutter App",
        home: Scaffold(
          appBar: AppBar(title: Text("Practice Mode"),),
          body: Three(),
        )
    );
  }
}