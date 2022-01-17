import 'package:flutter/material.dart';

void main(){
  runApp(
    MaterialApp(
      home: MChildren()
    )
  );
}

class MChildren extends StatefulWidget {
  @override
  _MChildrenState createState() => _MChildrenState();
}

class _MChildrenState extends State<MChildren> {
  int count = 0;

  void counter() {
    setState(() {
      count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "data $count",
          textDirection: TextDirection.ltr,
        ),
        ElevatedButton(
            onPressed: () {
              debugPrint("clicked");
              counter();
            },
            child: Text(
              "Click",
              textDirection: TextDirection.ltr,
            ))
      ],
    );
  }
}
