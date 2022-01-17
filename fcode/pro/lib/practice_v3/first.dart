import 'package:flutter/material.dart';
import 'package:flutter_profile_app/practice_v3/m_expand.dart';

void main() {
  runApp(new Main());
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Flutter App",
        home: Scaffold(
          appBar: AppBar(title: Text("Practice Mode v2"),),
          body: Material(
            color: Colors.red,
            child: Center(
              child: new MExpand(),
            ),
          ),
        )
    );
  }
}