import 'package:flutter/material.dart';

// void main(){
//   runApp(
//       MaterialApp(
//           home: RowColumn()
//       )
//   );
// }

class MExpand extends StatefulWidget {
  @override
  _MExpandState createState() => _MExpandState();
}

class _MExpandState extends State<MExpand> {
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
            Expanded(
                child: Container(
                  padding: EdgeInsets.all(9.0),
                  margin: EdgeInsets.only(right: 5.0),
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    border: Border.all(
                      color: Colors.black,
                      width: 1.0
                    )
                  ),
                  child: Text(
                      "data $count",
                      textDirection: TextDirection.ltr,
                      textAlign: TextAlign.center
                  ),
                ),
                flex: 3
            ),
            Expanded(
              child: ElevatedButton(
                  onPressed: () {
                    debugPrint("clicked");
                    counter();
                  },
                  child: Text(
                    "Click",
                    textDirection: TextDirection.ltr,
                  )),
              flex: 3,
            )
          ],
        )
      ],
    );
  }
}
