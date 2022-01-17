import 'package:flutter/material.dart';

class HelpFeedback extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _HelpFeedback();
  }
}

class _HelpFeedback extends State<HelpFeedback>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F4F9),
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Color(0xff607d8b),
        ),
        backgroundColor: Color(0xff8ededfb),
        title: Text(
          "Help & Feedback",
          style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold,
              color: Color(0xff607d8b)
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: ListView(
          children: [
            Container(
              height: 50,
              child: Image.asset("images/logo.png")
            ),
            SizedBox(height: 5,),
            Text(
              "Version 1.1",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(height: 20,),
            _distance(15),
            _title("Help"),
            _divider(),
            _distance(15),
            _buildOptions("Get help", (){
              print("get help clicked");
            }),
            _distance(20),
            _title("Feedback"),
            _divider(),
            _distance(15),
            _buildOptions("Send feedback", (){
              print("send feedback clicked");
            }),
            _distance(15),
            _buildOptions("Report problem", (){
              print("report problem clicked");
            }),
            _distance(15),
            _buildOptions("Suggest a feature", (){
              print("Suggest a feature clicked");
            }),
            _distance(20),
            _title("About us"),
            _divider(),
            _distance(15),
            _buildOptions("Privacy & cookies", (){
              print("send feedback clicked");
            }),
            _distance(15),
            _buildOptions("Terms & policies", (){
              print("Terms & policies clicked");
            }),
          ],
        ),
      ),
    );
  }

  Widget _title(String name){
    return Text(
        name,
        style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Color(0xFFCBC8E5)
        )
    );
  }

  Widget _divider(){
    return SizedBox(
      height: 1.5,
      child: Container(
        color: Color(0xFFCBC8E5),
      ),
    );
  }

  Widget _distance(double value){
    return SizedBox(height: value,);
  }

  Widget _buildOptions(String name, Function onPressed){
    return InkWell(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            name,
            style: TextStyle(
              fontSize: 16
            ),
          )
        ],
      ),
      onTap: onPressed,
    );
  }
}