import 'package:flutter/material.dart';

class SoftTest extends StatelessWidget{
  Color backgroundColor = Color(0xFFF1F2F6);
  Color shadowColor = Color(0xFFDADFF0);
  Color lightShadowColor = Colors.white;
  Color textColor = Color(0xFF707070);
  Color seekBarLightColor = Color(0xFFB8ECED);
  Color seekBarDarkColor = Color(0xFF37C8DF);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              Center(
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    borderRadius: BorderRadius.circular(32),
                    boxShadow: [
                      BoxShadow(
                          color: shadowColor,
                          offset: Offset(8, 6),
                          blurRadius: 12),
                      BoxShadow(
                          color: lightShadowColor,
                          offset: Offset(-8, -6),
                          blurRadius: 12),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                width: MediaQuery.of(context).size.width - 80,
                height: MediaQuery.of(context).size.width - 80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        MediaQuery.of(context).size.width),
                    gradient: LinearGradient(
                      colors: [shadowColor, lightShadowColor],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: shadowColor,
                          offset: Offset(8, 6),
                          blurRadius: 12),
                      BoxShadow(
                          color: lightShadowColor,
                          offset: Offset(-8, -6),
                          blurRadius: 12),
                    ]
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 32, vertical: 20),
                width: double.infinity,
                height: 24,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: backgroundColor,
                  boxShadow: [
                    BoxShadow(color: lightShadowColor, offset: Offset(1, 4)),
                    BoxShadow(color: shadowColor, offset: Offset(-1, -4)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}