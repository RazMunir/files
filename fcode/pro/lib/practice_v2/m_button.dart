import 'package:flutter/material.dart';

class MButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {},
          child: Text("Button"),
        ),
        OutlinedButton(
          onPressed: null,
          child: new Text(
            "Login",
            style: new TextStyle(color: Colors.white),

          ),
        )
      ],
    );
  }
}
