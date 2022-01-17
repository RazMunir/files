import 'package:flutter/material.dart';

class NavigationPage{
  static void pop(BuildContext context){
    Navigator.of(context).pop();
  }

  static void push(BuildContext context, Widget page){
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => page
      ),
    );
  }
}