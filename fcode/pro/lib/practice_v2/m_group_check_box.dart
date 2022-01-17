import 'package:flutter/material.dart';

class MGroupCheck extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _MGroupCheck();
  }
}

class _MGroupCheck extends State<MGroupCheck>{
  bool valMonday = false;
  bool valTuesday = false;
  bool valWednesday = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Group Checkboxes"),
        centerTitle: true,
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Monday"),
                Checkbox(
                  value: valMonday,
                  onChanged: (value){
                    setState(() {
                      valMonday = value;
                      valTuesday = false;
                      valWednesday = false;
                    });
                  }
                )
              ],
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Tuesday"),
                Checkbox(
                    value: valTuesday,
                    onChanged: (value){
                      setState(() {
                        valMonday = false;
                        valTuesday = value;
                        valWednesday = false;
                      });
                    }
                )
              ],
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Wednesday"),
                Checkbox(
                    value: valWednesday,
                    onChanged: (value){
                      setState(() {
                        valMonday = false;
                        valTuesday = false;
                        valWednesday = value;
                      });
                    }
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}