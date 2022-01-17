import 'package:flutter/material.dart';

class MSnackBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: ElevatedButton(
          child: Text("Show Snack Bar"),
          onPressed: () {
            final mSnackBar = SnackBar(
              content: Text('Yay! A SnackBar!'),
              backgroundColor: Colors.red,
              action: SnackBarAction(
                label: "Close",
                onPressed: (){
                  //do something
                },
              ),
            );
            ScaffoldMessenger.of(context).showSnackBar(mSnackBar);
          },
        ),
      ),
    );
  }

}