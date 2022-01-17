import 'package:flutter/material.dart';

class MAlign extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Text(
        "Hello man"
      ),
    );
  }

}