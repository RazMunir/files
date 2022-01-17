import 'package:flutter/material.dart';

class MIntrinsicWidth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: IntrinsicWidth(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: Text('Short'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('A bit Longer'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('The Longest text button'),
            ),
          ],
        ),
      ),
    );
  }
}
