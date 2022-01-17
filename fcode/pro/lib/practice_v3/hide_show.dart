import 'package:flutter/material.dart';

class HideShow extends StatefulWidget {
  @override
  _HideShowState createState() => _HideShowState();
}

class _HideShowState extends State<HideShow> {
  int isVisible = 1;

  // bool get ture => null;

  void changeValue() {
    setState(() {
      if (isVisible == 1) {
        isVisible = 2;
      } else {
        isVisible = 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('isVisible = $isVisible'),
        ),
        body: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                changeValue();
              },
              child: Icon(
                Icons.folder_shared_outlined,
                color: Colors.red[800],
              ),
            ),
            isVisible == 1 ? Icon(Icons.star, size: 150) : const SizedBox(),
            Text("Hello..!")
          ],
        ));
  }
}
