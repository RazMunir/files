import 'package:flutter/material.dart';

class MContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(9.0),
            margin: EdgeInsets.only(right: 5.0),
            decoration: BoxDecoration(
                color: Colors.yellow,
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                border: Border.all(color: Colors.black, width: 1.0)),
            child: Text("Data",
                textDirection: TextDirection.ltr, textAlign: TextAlign.center),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(9.0),
            margin: EdgeInsets.all(5.0),
            decoration: BoxDecoration(
                color: Colors.yellow,
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                border: Border.all(color: Colors.black, width: 1.0),
                boxShadow: [BoxShadow(blurRadius: 5.0)]),
            child: Text("Data",
                textDirection: TextDirection.ltr, textAlign: TextAlign.center),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(9.0),
            margin: EdgeInsets.all(5.0),
            decoration: BoxDecoration(
                color: Colors.yellow,
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                border: Border.all(color: Colors.black, width: 1.0),
                boxShadow: [BoxShadow(blurRadius: 5.0)]),
            child: Text("Data",
                textDirection: TextDirection.ltr, textAlign: TextAlign.left),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
              width: double.infinity,
              padding: EdgeInsets.all(9.0),
              margin: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  border: Border.all(color: Colors.black, width: 1.0),
                  boxShadow: [BoxShadow(blurRadius: 5.0)]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 100.0,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        border: Border.all(color: Colors.black, width: 1.0),
                        boxShadow: [BoxShadow(blurRadius: 5.0)]),
                    child: Text("In row",
                        textDirection: TextDirection.ltr,
                        textAlign: TextAlign.center),
                  ),
                ],
              )),
          SizedBox(
            height: 10.0,
          ),
          Container(
              width: double.infinity,
              padding: EdgeInsets.all(9.0),
              margin: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  border: Border.all(color: Colors.black, width: 1.0),
                  boxShadow: [BoxShadow(blurRadius: 5.0)]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 100.0,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        border: Border.all(color: Colors.black, width: 1.0),
                        boxShadow: [BoxShadow(blurRadius: 5.0)]),
                    child: Text("Row 1",
                        textDirection: TextDirection.ltr,
                        textAlign: TextAlign.center),
                  ),
                  SizedBox(),
                  Container(
                    width: 100.0,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        border: Border.all(color: Colors.black, width: 1.0),
                        boxShadow: [BoxShadow(blurRadius: 5.0)]),
                    child: Text("Row 3",
                        textDirection: TextDirection.ltr,
                        textAlign: TextAlign.center),
                  ),
                ],
              )),
          SizedBox(
            height: 10.0,
          ),
          Container(
              width: double.infinity,
              padding: EdgeInsets.all(9.0),
              margin: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  border: Border.all(color: Colors.black, width: 1.0),
                  boxShadow: [BoxShadow(blurRadius: 5.0)]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 100.0,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        border: Border.all(color: Colors.black, width: 1.0),
                        boxShadow: [BoxShadow(blurRadius: 5.0)]),
                    child: Text("Row 1",
                        textDirection: TextDirection.ltr,
                        textAlign: TextAlign.center),
                  ),
                  Container(
                    width: 100.0,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        border: Border.all(color: Colors.black, width: 1.0),
                        boxShadow: [BoxShadow(blurRadius: 5.0)]),
                    child: Text("Row 2",
                        textDirection: TextDirection.ltr,
                        textAlign: TextAlign.center),
                  ),
                  Container(
                    width: 100.0,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        border: Border.all(color: Colors.black, width: 1.0),
                        boxShadow: [BoxShadow(blurRadius: 5.0)]),
                    child: Text("Row 3",
                        textDirection: TextDirection.ltr,
                        textAlign: TextAlign.center),
                  ),
                ],
              )),
          SizedBox(
            height: 10.0,
          ),
          Container(
              width: double.infinity,
              padding: EdgeInsets.all(9.0),
              margin: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  border: Border.all(color: Colors.black, width: 1.0),
                  boxShadow: [BoxShadow(blurRadius: 5.0)]),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        border: Border.all(color: Colors.black, width: 1.0),
                        boxShadow: [BoxShadow(blurRadius: 5.0)]),
                    child: Text("Row 1",
                        textDirection: TextDirection.ltr,
                        textAlign: TextAlign.center),
                  ),
                ],
              )),
          Row(
            children: [
              Container(
                color: Colors.yellow,
                height: 20,
                width: MediaQuery.of(context).size.width,
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            height: 100.0,
            width: 100.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0,2),
                  blurRadius: 6.0,
                ),
              ],
              image: DecorationImage(
                image: AssetImage("images/person.png"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
