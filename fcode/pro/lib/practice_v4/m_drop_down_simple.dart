import 'package:flutter/material.dart';

class MDropDownSimple extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _MDropDownSimple();
  }

}

class _MDropDownSimple extends State<MDropDownSimple>{

  String selectedOption;
  List<String> options = ["Home", "Chat", "Recent", "Gallery", "Conversations"];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DropdownButton<String>(
        // underline: Container(),
        hint: Text("--Select--"),
        value: selectedOption,
        onChanged: (String value){
          setState(() {
            selectedOption = value;
          });
        },
        items: options.map((String v){
          return DropdownMenuItem<String>(
            value: v,
            child: Text(v),
          );
        }).toList(),
      ),
    );
  }

}