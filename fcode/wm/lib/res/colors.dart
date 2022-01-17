import 'package:flutter/material.dart';
import 'package:flutter_app_wallet_management/res/theme.dart';

// const kPrimaryColor = Color(0xFF00BF6D);
const kPrimaryColor = Color(0xFFFF7E7E);
// const kSecondaryColor = Color(0xFFFE9901);
const kSecondaryColor = Color(0xFF00BF6D);
const kErrorColor = Color(0xFFF03738);

const kContentColorLightTheme = Color(0xFF1D1D35);
const kContentColorDarkTheme = Color(0xFFF5FCF9);

Color colorSelectionAccordingToTheme(){
  switch(selectedTheme){
    case 1:
      return kContentColorLightTheme;
      break;
    default:
      return kContentColorDarkTheme;
      break;
  }
}

Color colorSelectionAccordingToThemeForDialog(){
  switch(selectedTheme){
    case 1:
      return kContentColorDarkTheme;
      break;
    default:
      return kContentColorLightTheme;
      break;
  }
}