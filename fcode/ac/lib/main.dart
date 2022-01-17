import 'package:flutter/material.dart';
import 'package:flutter_assistance_calc_app/assistance.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Assistance Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AssistanceCalc(),
    );
  }
}
