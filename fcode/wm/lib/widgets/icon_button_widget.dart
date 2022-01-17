import 'package:flutter/material.dart';

class IconButtonWidget extends StatelessWidget {
  final IconData icon;
  final Function onPress;

  const IconButtonWidget({
    Key key,
    this.icon,
    this.onPress
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: CircleAvatar(
        backgroundColor: Color(0xFFFF7E7E),
        radius: 20,
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
      onPressed: onPress,
    );
  }
}
