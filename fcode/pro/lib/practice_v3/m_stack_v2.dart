import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          top: true,
          child: AppBarCustom(),
        ),
      ),
    );
  }
}

class AppBarCustom extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Column(
        children: [
          Container(
            height: 70.0,
            color: Colors.white70,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    padding: EdgeInsets.all(1),
                    color: Colors.white70,
                    child: Icon(Icons.arrow_back_ios_outlined),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Column(
                    children: [
                      Container(
                        color: Colors.red,
                        child: Text("Hello"),
                      ),
                      Container(
                        color: Colors.red,
                        child: Text("Hello"),
                      ),
                      Container(
                        color: Colors.red,
                        child: Text("Hello"),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text("Hello"),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

}