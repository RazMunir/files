import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MToast extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: ElevatedButton(
          onPressed: () {
            Fluttertoast.showToast(msg: "Hello",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
          },
          child: Text("Button"),
        ),
      ),
    );
  }

}