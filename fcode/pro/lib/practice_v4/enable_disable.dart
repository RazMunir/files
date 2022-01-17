import 'package:flutter/material.dart';

class EnableDisable extends StatefulWidget {
  @override
  _EnableDisable createState() {
    return _EnableDisable();
  }
}

class _EnableDisable extends State<EnableDisable> {
  TextEditingController nameController = TextEditingController();

  bool _status = true;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          margin: EdgeInsets.all(5.0),
          child: TextField(
            controller: nameController,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'User Name',
                hintText: 'Enter Your Name',
                focusColor: Colors.yellowAccent,
                enabled: _status
            ),
            autofocus: _status,
          ),
        ),
        Container(
            margin: EdgeInsets.all(5.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      child: Icon(Icons.edit,),
                      onTap: () {
                        setState(() {
                          _status = !_status;
                        });
                        debugPrint("$_status");
                      },
                    ),
                    _status ? Icon(Icons.access_alarm) : Container()
                  ],
                ),
                TextField(
                  decoration: const InputDecoration(
                    hintText: "Enter Your Name",
                  ),
                  autofocus: false,
                ),
              ],
            ))
      ],
    );
  }
}
