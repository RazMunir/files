import 'package:flutter/material.dart';
import 'package:flutter_profile_app/screens/login_system/reset_password.dart';

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

class VerificationCode extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _VerificationCode();
  }
}

class _VerificationCode extends State<VerificationCode> {
  TextEditingController firstController = new TextEditingController(),
      secondController = new TextEditingController(),
      thirdController = new TextEditingController(),
      fourthController = new TextEditingController(),
      fivthController = new TextEditingController(),
      sixthController = new TextEditingController();

  Widget OTPDigitTextFieldBox(
      bool first, bool last, TextEditingController controller) {
    return Container(
      height: 55,
      // decoration: BoxDecoration(
      //   color: Colors.white,
      //   borderRadius: BorderRadius.circular(10.0),
      //   border: Border.all(width: 2,color: Colors.red),
      // ),
      child: AspectRatio(
        aspectRatio: 0.8,
        child: TextField(
          autofocus: true,
          controller: controller,
          onChanged: (value) {
            if (value.length == 1 && last == false) {
              FocusScope.of(context).nextFocus();
            }
            if (value.length == 0 && first == false) {
              FocusScope.of(context).previousFocus();
            }
          },
          onTap: () {
            if (controller.text.isNotEmpty) {
              controller.text = "";
            }
          },
          showCursor: false,
          readOnly: false,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16),
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 14),
            counter: Offstage(),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: Colors.black),
                borderRadius: BorderRadius.circular(10)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: Colors.pinkAccent),
                borderRadius: BorderRadius.circular(10)),
            // hintText: "*",
            // hintStyle: MyStyles.hintTextStyle,
          ),
        ),
      ),
    );
  }

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
            scrollDirection: Axis.vertical,
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
                          'Verification \nCode',
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
                        "Please enter your Verification Code",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87),
                      ),
                      Text(
                        "We have sent a verification code to your registered email ID.",
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
                        'Verification Code',
                        style: kLabelStyle,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            OTPDigitTextFieldBox(true, false, firstController),
                            OTPDigitTextFieldBox(
                                false, false, secondController),
                            OTPDigitTextFieldBox(false, false, thirdController),
                            OTPDigitTextFieldBox(
                                false, false, fourthController),
                            OTPDigitTextFieldBox(false, false, fivthController),
                            OTPDigitTextFieldBox(false, true, sixthController),
                          ],
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
                          onPressed: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ResetPassword()))
                          },
                          // color: Colors.white,
                          child: Text(
                            'DONE',
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
