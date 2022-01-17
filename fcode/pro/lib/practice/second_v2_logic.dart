import 'dart:math';

import 'package:flutter/material.dart';

//organize code: decrease code from main function
class SecondV2Logic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.red,
        child: Center(
          child: Text(
              generateRandomNumber(),
              textDirection: TextDirection.ltr,
              style: TextStyle(fontSize: 40.0),
            ),
          )
        );
  }

  String generateRandomNumber(){

    var random = new Random();

    int randomNumber = random.nextInt(6);
    return "Your Number is $randomNumber : v3";
  }
}