import 'package:flutter/material.dart';

class MTextField extends StatefulWidget {
  @override
  _MTextField createState() {
    return _MTextField();
  }
}

class _MTextField extends State<MTextField> {
  TextEditingController nameController = TextEditingController();
  FocusNode _focusNode = new FocusNode();

  // void initState() {
  //   _focusNode.addListener(() {
  //     setState(() {});
  //   });
  // }

  @override
  void initState() {
    _focusNode.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData(
      //   primaryColor: Colors.white
      // ),
      home: Scaffold(
        body: Material(
          color: Colors.red,
          child: ListView(
            children: [
              Container(
                margin: EdgeInsets.all(5.0),
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'User Name',
                      labelStyle: TextStyle(color: Colors.cyanAccent),
                      hintText: 'Enter Your Name',
                      enabled: true),
                  autofocus: true,
                ),
              ),
              Container(
                  margin: EdgeInsets.all(5.0),
                  child: Column(
                    children: [
                      InkWell(
                        child: Icon(Icons.edit),
                        onTap: (){
                          String data = nameController.text;
                          print("$data");
                        },
                      ),
                      TextField(
                        decoration: InputDecoration(
                          hintText: "Enter Your Name",
                        ),
                        autofocus: false,
                      ),
                      TextField(
                        decoration: InputDecoration(
                            hintText: "One", border: InputBorder.none),
                      ),
                      TextField(
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        decoration: InputDecoration(
                          hintText: "Two: number type",
                          border: InputBorder.none,
                        ),
                      ),
                      TextField(
                        cursorColor: Colors.yellowAccent,
                        cursorRadius: Radius.circular(16.0),
                        cursorWidth: 2.0,
                        maxLength: 8,
                        maxLines: 1,
                        obscureText: false,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: "Custom Design",
                          hintStyle: TextStyle(color: Colors.cyanAccent),
                          icon: Icon(Icons.person),
                          prefixIcon: Icon(Icons.folder_shared_outlined),
                          suffixIcon: Icon(Icons.folder_shared),
                          prefix: CircularProgressIndicator(),
                        ),
                      ),
                      TextField(
                          decoration:
                              InputDecoration.collapsed(hintText: "Collapsed")),
                      TextField(
                        decoration: InputDecoration(
                            hintText: "Focus Border color",
                            focusedBorder: UnderlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.white, width: 2.0))),
                      ),
                      TextField(
                        decoration: InputDecoration(
                            hintText: "Focus outline Border color",
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.white, width: 2.0),
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: const BorderSide(
                                    color: Colors.cyanAccent, width: 2.0
                                )
                            )
                        ),
                      ),
                      Theme(
                        data: ThemeData(
                            primaryColor: Colors.white,
                            accentColor: Colors.yellowAccent),
                        child: TextField(
                          cursorColor: Colors.yellowAccent,
                          cursorRadius: Radius.circular(16.0),
                          cursorWidth: 2.0,
                          maxLength: 8,
                          maxLines: 1,
                          obscureText: false,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintText: "Theme",
                            hintStyle: TextStyle(color: Colors.cyanAccent),
                            icon: Icon(Icons.person),
                            prefixIcon: Icon(Icons.folder_shared_outlined),
                            suffixIcon: Icon(Icons.folder_shared),
                            prefix: CircularProgressIndicator(),
                          ),
                        ),
                      ),
                      Theme(
                        data: ThemeData(primaryColor: Colors.cyanAccent),
                        child: TextField(
                          focusNode: _focusNode,
                          cursorColor: Colors.yellowAccent,
                          cursorRadius: Radius.circular(16.0),
                          cursorWidth: 2.0,
                          maxLength: 8,
                          maxLines: 1,
                          obscureText: false,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintText: "Focus Node",
                            hintStyle: TextStyle(color: Colors.cyanAccent),
                            icon: Icon(
                              Icons.person,
                              color: _focusNode.hasFocus
                                  ? Colors.yellowAccent
                                  : Colors.black,
                            ),
                            prefixIcon: Icon(
                              Icons.folder_shared_outlined,
                              color: _focusNode.hasFocus
                                  ? Colors.yellowAccent
                                  : Colors.black,
                            ),
                            suffixIcon: Icon(
                              Icons.folder_shared,
                              color: _focusNode.hasFocus
                                  ? Theme.of(_focusNode.context).primaryColor
                                  : Colors.black,
                            ),
                            prefix: CircularProgressIndicator(),
                          ),
                        ),
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
