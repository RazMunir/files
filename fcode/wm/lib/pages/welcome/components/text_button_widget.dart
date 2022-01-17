import 'package:flutter/material.dart';
import 'package:flutter_app_wallet_management/controllers/type_controller.dart';
import 'package:flutter_app_wallet_management/models/type.dart';
import 'package:flutter_app_wallet_management/res/colors.dart';
import 'package:flutter_app_wallet_management/res/dimensions.dart';
import 'package:flutter_app_wallet_management/res/strings.dart';
import 'package:flutter_app_wallet_management/wm_main.dart';

class TextButtonWidget extends StatelessWidget {
  final TypeController controller;

  const TextButtonWidget({Key key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: TextButton(
        onPressed: ()  {
          if(controller.list.isEmpty){
            controller.addObj(Type(name: depositString));
            controller.addObj(Type(name: expenseString));
          }

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => WMMain(),
            ),
          );
        },
        child: Row(
          children: [
            Text(
              "Skip",
              style: TextStyle(
                fontSize: 12,
                color: kPrimaryColor
              ),
            ),
            SizedBox(
              width: kDefaultPadding / 4,
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: kPrimaryColor,
            )
          ],
        ),
      ),
    );
  }
}
