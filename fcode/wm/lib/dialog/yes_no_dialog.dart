import 'package:flutter/material.dart';
import 'package:flutter_app_wallet_management/res/colors.dart';
import 'package:flutter_app_wallet_management/res/strings.dart';

void yesNoDialog({
  BuildContext context,
  String title,
  String desMsg,
  Function onContinue,
  Function onCancel
}){

  TextStyle style = TextStyle(
    color: kPrimaryColor
  );

  Widget continueButton = TextButton(
    child: Text(
      yesString,
      style: style
    ),
    onPressed: onContinue,
  );
  Widget cancelButton = TextButton(
    child: Text(
      noString,
      style: style,
    ),
    onPressed: onCancel,
  );

  AlertDialog alert = AlertDialog(
    title: Text(title),
    content: Text(deleteDialogMsgString),
    backgroundColor: colorSelectionAccordingToThemeForDialog(),
    actions: [
      continueButton,
      cancelButton
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}