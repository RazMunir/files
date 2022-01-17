import 'package:flutter/material.dart';

List<Map<String,dynamic>> colors = [
  {
    'icon': 0xFF8C93C7,
    'barBg': 0xFF8EDEDFB,
    'text': 0xFF464A64,
    'barShadow': 0xFFA5A3D1,
    'bg': 0xFFF4F4F9,
    'iconBelow': 0xFF464A65,
    'iconBg': 0xFFCBC8E5
  }
];

final kLabelStyle = TextStyle(
  color: Color(colors[0]['text']),
  fontWeight: FontWeight.bold,
);

final kHintTextStyle = TextStyle(
  color: Colors.white54,
  fontFamily: 'OpenSans',
);

final kBoxDecorationStyle = BoxDecoration(
  color: Color(colors[0]['iconBg']),
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);

class SignIn extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _SignIn();
  }
}

class _SignIn extends State<SignIn>{

  Widget _buildSocialBtn(Function onTap, AssetImage logo) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40.0,
        width: 40.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0,2),
              blurRadius: 6.0,
            ),
          ],
          image: DecorationImage(
            image: logo,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          color: Color(colors[0]['bg']),
        ),
        Container(
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(vertical: 120, horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Sign In',
                  style: TextStyle(
                    color: Color(colors[0]["text"]),
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 30,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Email',
                      style: kLabelStyle,
                    ),
                    SizedBox(height: 10,),
                    Container(
                      alignment: Alignment.centerLeft,
                      decoration: kBoxDecorationStyle,
                      height: 55.0,
                      child: TextField(
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(top: 14.0),
                          prefixIcon: Icon(
                            Icons.email,
                            color: Color(colors[0]['icon']),
                            // color: Colors.white,
                          ),
                          hintText: 'Enter your Email',
                          hintStyle: kHintTextStyle,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Password',
                      style: kLabelStyle,
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      alignment: Alignment.centerLeft,
                      decoration: kBoxDecorationStyle,
                      height: 55.0,
                      child: TextField(
                        obscureText: true,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(top: 14.0),
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Color(colors[0]['icon']),
                          ),
                          hintText: 'Enter your Password',
                          hintStyle: kHintTextStyle,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () => print('Forgot Password Button Pressed'),
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all(EdgeInsets.only(right: 0.0))
                    ),
                    child: Text(
                      'Forgot Password?',
                      style: kLabelStyle,
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
                      primary: Color(colors[0]['iconBg']),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    onPressed: () => print('Login Button Pressed'),
                    // color: Colors.white,
                    child: Text(
                      'LOGIN',
                      style: TextStyle(
                        color: Color(colors[0]['text']),
                        letterSpacing: 1.5,
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Column(
                  children: <Widget>[
                    Text(
                      '- OR -',
                      style: TextStyle(
                        color: Color(colors[0]['iconBelow']),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      'Sign in with',
                      style: kLabelStyle,
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      _buildSocialBtn(
                            () => print('Login with Facebook'),
                        AssetImage(
                          'images/logos/facebook.jpg',
                        ),
                      ),
                      _buildSocialBtn(
                            () => print('Login with Google'),
                        AssetImage(
                          'images/logos/google.jpg',
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () => print('Sign Up Button Pressed'),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Don\'t have an Account? ',
                          style: TextStyle(
                            color: Color(colors[0]['text']),
                            fontSize: 16.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextSpan(
                          text: 'Sign Up',
                          style: TextStyle(
                            color: Color(colors[0]['text']),
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}