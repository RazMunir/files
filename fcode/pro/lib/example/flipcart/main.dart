import 'package:flutter/material.dart';
import 'package:flutter_profile_app/example/flipcart/splash/splash_screen.dart';

import 'Constant/constant.dart';
import 'Home/home_page.dart';

class FlipCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: <String, WidgetBuilder>{
      SPLASH_SCREEN: (BuildContext context) => AnimatedSplashScreen(),
      HOME_SCREEN: (BuildContext context) => HomePage(),
    },
    home: AnimatedSplashScreen(),);
  }
}
