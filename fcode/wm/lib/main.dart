import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_wallet_management/res/theme.dart';
import 'package:flutter_app_wallet_management/pages/welcome/welcome_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      initTheme: selectedTheme == 1 ? lightThemeData(context) : darkThemeData(context),
      child: Builder(
        builder: (context) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'WM',
            theme: ThemeProvider.of(context),
            home: WelcomePage(),
          );
        }
      ),
    );
  }
}
