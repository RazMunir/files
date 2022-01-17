import 'package:flutter/material.dart';

class MElevation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        // padding: EdgeInsets.symmetric(vertical: 30),
        // padding: const EdgeInsets.only(bottom: 30.0),
        padding: const EdgeInsets.all(30.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5.0),
          child: Container(
            height: 100.0,
            margin: const EdgeInsets.only(bottom: 6.0),
            //Same as `blurRadius` i guess
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0.0, 1.0), //(x,y)
                  // offset: Offset(2.0, 2.0) //// shadow direction: top left
                  // offset: Offset(-2.0, -2.0) // shadow direction: bottom right
                  blurRadius: 6.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
