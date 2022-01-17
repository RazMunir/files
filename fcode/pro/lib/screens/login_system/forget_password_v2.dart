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

class ForgetPassword extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ForgetPassword();
  }
}

class _ForgetPassword extends State<ForgetPassword> {
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.height;

    return Container(
      color: Color(colors[0]["bg"]),
      padding: EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.arrow_back_ios_outlined),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      'Forget \nPassword',
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
            SizedBox(height: size * 0.1,),
            Container(
              alignment: Alignment.center,
              child: CircleAvatar(
                backgroundImage: AssetImage('images/person.png'),
                radius: 65,
              ),
            ),
            SizedBox(height: size * 0.1,),
            Container(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Please enter your registered email ID",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87),
                  ),
                  Text(
                    "We will send verification code to your registered email ID.",
                    style: TextStyle(fontSize: 12, color: Colors.black87),
                  ),
                ],
              ),
            ),
            SizedBox(height: size * 0.1,),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Email',
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
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(
                        color: Colors.black87,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(top: 14.0),
                        prefixIcon: Icon(
                          Icons.email,
                          color: Color(colors[0]['icon']),
                        ),
                        hintText: 'Enter your Email',
                        hintStyle: kHintTextStyle,
                      ),
                    ),
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
                      onPressed: () {
                        print('Next button Pressed');
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => VerificationCode()));
                      },
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
    );
  }
}
