import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final double fontSize;
  final double letterSpacing;
  final FontWeight fontWeight;

  const TextWidget({
    Key key,
    this.text,
    this.fontSize = 16.0,
    this.letterSpacing = 2,
    this.fontWeight = FontWeight.w600
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        letterSpacing: letterSpacing,
        fontWeight: fontWeight,
      ),
    );
  }
}
