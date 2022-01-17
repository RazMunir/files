import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_profile_app/practice_v5/reusable_code_helper.dart';

class ReusableCode extends StatefulWidget {
  @override
  _ReusableCode createState() {
    return _ReusableCode();
  }
}

class _ReusableCode extends State<ReusableCode> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          _firstPortion(),
          _secondPortion(),
          Container(
            child: Column(
              children: [
                ReusableCodeHelper(
                    "Jhon Anderson", Icons.person_outline_outlined, () async {
                  Fluttertoast.showToast(msg: "Hello",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0);
                }),
                Container(
                  margin:
                      EdgeInsets.only(left: 20, right: 10, top: 0, bottom: 10),
                  child: Row(
                    children: [
                      CircleAvatar(
                        child: Icon(
                          Icons.email_outlined,
                          color: Colors.white,
                        ),
                        backgroundColor: Colors.black,
                        radius: 18,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 15),
                        child: Text(
                          "smartuser@gmail.com",
                          style: TextStyle(color: Colors.black, fontSize: 14),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.only(left: 20, right: 10, top: 0, bottom: 10),
                  child: Row(
                    children: [
                      CircleAvatar(
                        child: Icon(
                          Icons.phone_outlined,
                          color: Colors.white,
                        ),
                        backgroundColor: Colors.black,
                        radius: 18,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 15),
                        child: Text(
                          "+8801313406606",
                          style: TextStyle(color: Colors.black, fontSize: 14),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.only(left: 20, right: 10, top: 0, bottom: 10),
                  child: Row(
                    children: [
                      CircleAvatar(
                        child: Icon(
                          Icons.card_giftcard_outlined,
                          color: Colors.white,
                        ),
                        backgroundColor: Colors.black,
                        radius: 18,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 15),
                        child: Text(
                          "1990 Jan 31",
                          style: TextStyle(color: Colors.black, fontSize: 14),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.only(left: 20, right: 10, top: 0, bottom: 10),
                  child: Row(
                    children: [
                      CircleAvatar(
                        child: Icon(
                          Icons.location_on_outlined,
                          color: Colors.white,
                        ),
                        backgroundColor: Colors.black,
                        radius: 18,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 15),
                        child: Text(
                          "Lalkhan Bazar, Chattogram, BD",
                          style: TextStyle(color: Colors.black, fontSize: 14),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _firstPortion() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    border: Border.all(color: Colors.grey, width: 1.0),
                    image: DecorationImage(
                        image: AssetImage('images/camera.png'))),
              ),
              Container(
                margin: EdgeInsets.only(top: 8),
                child: Text(
                  "Jhone Rose",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _secondPortion() {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 10, top: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Personal Information",
            style: TextStyle(
                color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Icon(
              Icons.edit_outlined,
              color: Colors.deepOrange[400],
              size: 24,
            ),
          )
        ],
      ),
    );
  }
}
