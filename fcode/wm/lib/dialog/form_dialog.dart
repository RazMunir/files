import 'package:flutter/material.dart';
import 'package:flutter_app_wallet_management/res/colors.dart';
import 'package:flutter_app_wallet_management/res/dimensions.dart';

void formDialog({BuildContext context, String title, Widget formWidget}){
  showDialog(
      context: context,
      builder: (context){
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(kDefaultPadding))),
          backgroundColor: colorSelectionAccordingToThemeForDialog(),
          content: Container(
            width: 300,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 14.0),
                ),
                SizedBox(
                  height: kDefaultPadding,
                ),
                formWidget
              ],
            ),
          ),
        );
      }
  );
}