import 'package:flutter/material.dart';

class MStack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      child: Stack(
        children: [
          Container(
            child: Column(
              children: [
                Container(
                    width: double.infinity,
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [BoxShadow(blurRadius: 5)],
                      color: Colors.red,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.yellow,
                              borderRadius: BorderRadius.all(Radius.circular(50)),
                              border: Border.all(color: Colors.black, width: 1.0),
                              image: DecorationImage(
                                  image: AssetImage('images/camera.png'))),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 15.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Hello Text",
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                    wordSpacing: 3.0,
                                    color: Colors.orange[50],
                                    fontFamily: 'Redressed'),
                              ),
                              Text(
                                "Hello Text",
                                style: TextStyle(
                                    fontSize: 12.0,
                                    wordSpacing: 3.0,
                                    color: Colors.orange[50]),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                    child: Icon(
                                      Icons.play_circle_fill,
                                      size: 20,
                                      color: Colors.white,
                                    )),
                                Container(
                                    margin: EdgeInsets.only(left: 10),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.favorite,
                                          size: 20,
                                          color: Colors.white,
                                        ),
                                        Text(
                                          "12",
                                          style: TextStyle(
                                              fontSize: 8.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.orange[50]),
                                        )
                                      ],
                                    )),
                              ],
                            ),
                          ),
                        )
                      ],
                    )),
                Container(
                    width: double.infinity,
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [BoxShadow(blurRadius: 5)],
                      color: Colors.red,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.yellow,
                              borderRadius: BorderRadius.all(Radius.circular(50)),
                              border: Border.all(color: Colors.black, width: 1.0),
                              image: DecorationImage(
                                  image: AssetImage('images/camera.png'))),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 15.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Hello Text",
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                    wordSpacing: 3.0,
                                    color: Colors.orange[50],
                                    fontFamily: 'Redressed'),
                              ),
                              Text(
                                "Hello Text",
                                style: TextStyle(
                                    fontSize: 12.0,
                                    wordSpacing: 3.0,
                                    color: Colors.orange[50]),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                    child: Icon(
                                      Icons.play_circle_fill,
                                      size: 20,
                                      color: Colors.white,
                                    )),
                                Container(
                                    margin: EdgeInsets.only(left: 10),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.favorite,
                                          size: 20,
                                          color: Colors.white,
                                        ),
                                        Text(
                                          "12",
                                          style: TextStyle(
                                              fontSize: 8.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.orange[50]),
                                        )
                                      ],
                                    )),
                              ],
                            ),
                          ),
                        )
                      ],
                    )),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              child: Text(
                "Center",
              ),
            ),
          ),
          Align(
            alignment: Alignment(1.0, 0.0),
            child: Text( "Custom position"),
          ),
          Align(
            alignment: Alignment(-1.0, 0.0),
            child: Text( "Custom position"),
          )
        ],
      ),
    );
  }
}
