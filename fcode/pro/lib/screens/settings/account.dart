import 'package:flutter/material.dart';

class Account extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _Account();
  }
}

class _Account extends State<Account>{
  bool oldPass = true, newPass =true, confirmPass = true;
  TextEditingController _oldPassController = TextEditingController(),
    _newPassController = TextEditingController(),
    _confirmPassController = TextEditingController();

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
          "Account",
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
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Theme(
                data: ThemeData(
                  primaryColor: Color(0xFFA5A3D1),
                ),
                child: TextFormField(
                  controller: _oldPassController,
                  cursorColor: Color(0xFFCBC8E5),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(
                        color: Colors.black87,
                      ),
                    ),
                    labelText: "Old password",
                    hintText: "Enter old password",
                    suffixIcon: InkWell(
                      child: Icon(oldPass ? Icons.remove_red_eye_outlined : Icons.block_outlined),
                      onTap: (){
                        setState(() {
                          oldPass = !oldPass;
                        });
                      },
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    // isDense: true
                  ),
                  obscureText: oldPass,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Theme(
                data: ThemeData(
                  primaryColor: Color(0xFFA5A3D1),
                ),
                child: TextFormField(
                  controller: _newPassController,
                  cursorColor: Color(0xFFCBC8E5),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(
                        color: Colors.black87,
                      ),
                    ),
                    labelText: "New password",
                    hintText: "Enter new password",
                    suffixIcon: InkWell(
                      child: Icon(newPass ? Icons.remove_red_eye_outlined : Icons.block_outlined),
                      onTap: (){
                        setState(() {
                          newPass = !newPass;
                        });
                      },
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    // isDense: true
                  ),
                  obscureText: newPass,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Theme(
                data: ThemeData(
                  primaryColor: Color(0xFFA5A3D1),
                ),
                child: TextFormField(
                  controller: _confirmPassController,
                  cursorColor: Color(0xFFCBC8E5),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(
                        color: Colors.black87,
                      ),
                    ),
                    labelText: "Confirm password",
                    hintText: "Enter confirm password",
                    suffixIcon: InkWell(
                      child: Icon(confirmPass ? Icons.remove_red_eye_outlined : Icons.block_outlined),
                      onTap: (){
                        setState(() {
                          confirmPass = !confirmPass;
                        });
                      },
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    // isDense: true
                  ),
                  obscureText: confirmPass,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(15.0),
                  elevation: 2.0,
                  primary: Color(0xFFCBC8E5),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      // side: BorderSide(color: Colors.red, width: 5)
                  ),
                ),
                onPressed: () => print('change password Button Pressed'),
                // color: Colors.white,
                child: Text(
                  'Change Password',
                  style: TextStyle(
                    color: Color(0xFF464A64),
                    letterSpacing: 1.5,
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            SizedBox(
              height: 1.5,
              child: Container(
                color: Color(0xFFCBC8E5),
              ),
            ),
            InkWell(
              child: Container(
                margin: EdgeInsets.only(top: 20, bottom: 20),
                child: Text(
                  "Delete your account",
                  style: TextStyle(
                      color: Colors.redAccent,
                      fontSize: 18
                  ),
                )
              ),
              onTap: (){
                print("Delete account pressed");
              },
            )
          ],
        ),
      ),
    );
  }
}