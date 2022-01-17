import 'package:flutter/material.dart';

class Appearance extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _Appearance();
  }
}

class _Appearance extends State<Appearance>{
  bool isLightMode = true,
      isNightMode = false,
      isVictory = false,
      isWinter = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F4F9),
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Color(0xff607d8b)
        ),
        backgroundColor: Color(0xff8ededfb),
        title:  Text(
          "Appearance",
          style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold,
              color: Color(0xff607d8b)),
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: ListView(
          children: [
            _distance(15),
            _title("Modes"),
            _divider(),
            _buildCheckBox("Light Mode", isLightMode, (bool value){
              setState(() {
                isLightMode = value;
                isNightMode = false;
                isVictory = false;
                isWinter = false;
              });
            }),
            _buildCheckBox("Night Mode", isNightMode, (bool value){
              setState(() {
                isLightMode = false;
                isNightMode = value;
                isVictory = false;
                isWinter = false;
              });
            }),
            _distance(20),
            _title("Theme"),
            _divider(),
            _buildCheckBox("Victory", isVictory, (bool value){
              setState(() {
                isLightMode = false;
                isNightMode = false;
                isVictory = value;
                isWinter = false;
              });
            }),
            _buildCheckBox("Winter", isWinter, (bool value){
              setState(() {
                isLightMode = false;
                isNightMode = false;
                isVictory = false;
                isWinter = value;
              });
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
  Widget _buildCheckBox(String name, bool isChecked, Function onChanged){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(name),
        Theme(
          data: Theme.of(context).copyWith(
              unselectedWidgetColor: Color(0xFF8C93C7),
          ),
          child: Checkbox(
            activeColor: Color(0xFF8C93C7),
            value: isChecked,
            onChanged: onChanged,
          ),
        )
      ],
    );
  }
}