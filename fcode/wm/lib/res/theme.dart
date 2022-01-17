import 'package:flutter/material.dart';
import 'package:flutter_app_wallet_management/res/colors.dart';

int selectedTheme = 1;

ThemeData lightThemeData(BuildContext context){
  return ThemeData.light().copyWith(
    primaryColor: kPrimaryColor,
    scaffoldBackgroundColor: kContentColorDarkTheme,
    appBarTheme: appBarTheme,
    canvasColor: kContentColorDarkTheme,
    dividerColor: kContentColorLightTheme,
    textTheme: Theme.of(context).textTheme.apply(
      bodyColor: kContentColorLightTheme,
      displayColor: kContentColorLightTheme,
      fontFamily: "Lato"
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: kContentColorDarkTheme,
      selectedItemColor: kContentColorLightTheme.withOpacity(0.7),
      unselectedItemColor: kContentColorLightTheme.withOpacity(0.32),
      selectedIconTheme:  IconThemeData(color: kPrimaryColor),
      showUnselectedLabels: true,
    ),
  );
}

ThemeData darkThemeData (BuildContext context){
  return ThemeData.light().copyWith(
    primaryColor: kPrimaryColor,
    scaffoldBackgroundColor: kContentColorLightTheme,
    appBarTheme: appBarTheme,
    canvasColor: kContentColorLightTheme,
    dividerColor: kContentColorDarkTheme,
    textTheme: Theme.of(context).textTheme.apply(
      bodyColor: kContentColorDarkTheme,
      displayColor: kContentColorDarkTheme,
      fontFamily: "Lato"
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: kContentColorLightTheme,
      selectedItemColor: Colors.white70,
      unselectedItemColor: kContentColorDarkTheme.withOpacity(0.32),
      selectedIconTheme: IconThemeData(color: kPrimaryColor),
      showUnselectedLabels: true,
    ),
  );
}

final appBarTheme = AppBarTheme(
  centerTitle: false,
  elevation: 0,
  backgroundColor: Colors.transparent,
  // foregroundColor: colorSelectionAccordingToTheme(), // for changing icon, text color
  iconTheme: IconThemeData(
    color: kPrimaryColor
  )
);