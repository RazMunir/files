import 'package:flutter/material.dart';
import 'package:flutter_app_wallet_management/res/colors.dart';
import 'package:flutter_app_wallet_management/res/dimensions.dart';

class ButtonWidget extends StatelessWidget{
  const ButtonWidget({
    Key key,
    @required this.text,
    @required this.press,
    this.color = kPrimaryColor,
    this.padding = const EdgeInsets.all(kDefaultPadding * 0.50),
    this.size = 0
  }) : super(key: key);

  final String text;
  final VoidCallback press;
  final color;
  final EdgeInsets padding;
  final double size;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(40)),
      ),
      padding: padding,
      color: color,
      minWidth: (this.size == 0) ? double.infinity : this.size,
      onPressed: press,
      child: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}