import 'package:flutter/material.dart';
import 'package:flutter_profile_app/screens/login_system/verification_code.dart';

List<Map<String, dynamic>> colors = [
  {
    'icon': 0xFF8C93C7,
    'barBg': 0xFF8EDEDFB,
    'text': 0xFF464A64,
    'barShadow': 0xFFA5A3D1,
    'bg': 0xFFF4F4F9,
    'iconBelow': 0xFF464A65,
    'iconBg': 0xFFCBC8E5,
    'btn': 0xFFF5C142,
    'fieldBg': 0xFFF6F6F6
  }
];

final kLabelStyle = TextStyle(
  color: Color(colors[0]['text']),
  fontWeight: FontWeight.bold,
);

final kHintTextStyle = TextStyle(
  color: Colors.black38,
  fontFamily: 'OpenSans',
);

final kBoxDecorationStyle = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);

class ResetPassword extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ResetPassword();
  }
}

class _ResetPassword extends State<ResetPassword> {
  TextEditingController newPassController = new TextEditingController(),
      confirmPassController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(colors[0]["bg"]),
      body: SafeArea(
        child: Container(
          color: Color(colors[0]["bg"]),
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        child: Icon(Icons.arrow_back_ios_outlined),
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          'Reset \nPassword',
                          style: TextStyle(
                            color: Color(colors[0]["text"]),
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size * 0.1,
                ),
                Container(
                  alignment: Alignment.center,
                  child: CircleAvatar(
                    backgroundImage: AssetImage('images/person.png'),
                    radius: 65,
                  ),
                ),
                SizedBox(
                  height: size * 0.1,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Please enter your new password",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87),
                      ),
                      Text(
                        "It will be your present password",
                        style: TextStyle(fontSize: 12, color: Colors.black87),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size * 0.1,
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'New Password',
                        style: kLabelStyle,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        decoration: kBoxDecorationStyle,
                        height: 55.0,
                        child: TextField(
                          controller: newPassController,
                          style: TextStyle(
                            color: Colors.black87,
                          ),
                          obscureText: true,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(top: 14.0),
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Color(colors[0]['icon']),
                            ),
                            hintText: 'Enter your new Password',
                            hintStyle: kHintTextStyle,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Confirm Password',
                            style: kLabelStyle,
                          ),
                          SizedBox(height: 10.0),
                          Container(
                            alignment: Alignment.centerLeft,
                            decoration: kBoxDecorationStyle,
                            height: 55.0,
                            child: TextField(
                              controller: confirmPassController,
                              obscureText: true,
                              style: TextStyle(
                                color: Colors.black87,
                              ),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.only(top: 14.0),
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: Color(colors[0]['icon']),
                                ),
                                hintText: 'Re-enter your Password',
                                hintStyle: kHintTextStyle,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 25.0),
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(15.0),
                            elevation: 5.0,
                            primary: Color(colors[0]['btn']),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                          onPressed: () {},
                          // color: Colors.white,
                          child: Text(
                            'NEXT',
                            style: TextStyle(
                              color: Color(colors[0]['text']),
                              letterSpacing: 1.5,
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
