import 'package:flutter/material.dart';

// void main(){
//   runApp(
//       MaterialApp(
//           home: RowColumn()
//       )
//   );
// }

class RowColumn extends StatefulWidget {
  @override
  _RowColumnState createState() => _RowColumnState();
}

class _RowColumnState extends State<RowColumn> {
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
        Row(
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
        )
      ],
    );
  }
}
