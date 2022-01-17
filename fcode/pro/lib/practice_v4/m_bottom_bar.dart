import 'package:flutter/material.dart';

class MBottomBar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 70),
            child: ListView(
              children: [
                Text("first",textAlign: TextAlign.center, ),
                Text("Hello",textAlign: TextAlign.center, ),
                Text("Hello",textAlign: TextAlign.center, ),
                Text("Hello",textAlign: TextAlign.center, ),
                Text("Hello",textAlign: TextAlign.center, ),
                Text("Hello",textAlign: TextAlign.center, ),
                Text("Hello",textAlign: TextAlign.center, ),
                Text("Hello",textAlign: TextAlign.center, ),
                Text("Hello",textAlign: TextAlign.center, ),
                Text("Hello",textAlign: TextAlign.center, ),
                Text("Hello",textAlign: TextAlign.center, ),
                Text("Hello",textAlign: TextAlign.center, ),
                Text("Hello",textAlign: TextAlign.center, ),
                Text("Hello",textAlign: TextAlign.center, ),
                Text("Hello",textAlign: TextAlign.center, ),
                Text("Hello",textAlign: TextAlign.center, ),
                Text("Hello",textAlign: TextAlign.center, ),
                Text("Hello",textAlign: TextAlign.center, ),
                Text("Hello",textAlign: TextAlign.center, ),
                Text("Hello",textAlign: TextAlign.center, ),
                Text("Hello",textAlign: TextAlign.center, ),
                Text("Hello",textAlign: TextAlign.center, ),
                Text("Hello",textAlign: TextAlign.center, ),
                Text("Hello",textAlign: TextAlign.center, ),
                Text("Hello",textAlign: TextAlign.center, ),
                Text("Hello",textAlign: TextAlign.center, ),
                Text("Hello",textAlign: TextAlign.center, ),
                Text("Hello",textAlign: TextAlign.center, ),
                Text("Hello",textAlign: TextAlign.center, ),
                Text("Hello",textAlign: TextAlign.center, ),
                Text("Hello",textAlign: TextAlign.center, ),
                Text("Hello",textAlign: TextAlign.center, ),
                Text("Hello",textAlign: TextAlign.center, ),
                Text("Hello",textAlign: TextAlign.center, ),
                Text("Hello",textAlign: TextAlign.center, ),
                Text("Hello",textAlign: TextAlign.center, ),
                Text("Hello",textAlign: TextAlign.center, ),
                Text("Hello",textAlign: TextAlign.center, ),
                Text("Hello",textAlign: TextAlign.center, ),
                Text("Hello",textAlign: TextAlign.center, ),
                Text("Hello",textAlign: TextAlign.center, ),
                Text("Hello",textAlign: TextAlign.center, ),
                Text("Hello",textAlign: TextAlign.center, ),
                Text("Last",textAlign: TextAlign.center, ),

              ],
            ),
          ),
          Positioned(
            bottom: 0.0,
            height: 70,
            child:Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.red,
              margin: const EdgeInsets.all(0.0),
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Align(
                    alignment: Alignment.bottomCenter,
                    child: new ButtonBar(
                      alignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new OutlineButton(
                          onPressed: null,
                          child: new Text(
                            "Login",
                            style: new TextStyle(color: Colors.white),
                          ),
                        ),
                        new RaisedButton(
                          color: Colors.white,
                          onPressed: null,
                          child: new Text(
                            "Register",
                            style: new TextStyle(color: Colors.black),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

}