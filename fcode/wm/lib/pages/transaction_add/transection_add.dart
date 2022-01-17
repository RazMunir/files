import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_wallet_management/pages/transaction_add/components/transaction_add_form.dart';
import 'package:flutter_app_wallet_management/res/colors.dart';
import 'package:flutter_app_wallet_management/res/dimensions.dart';
import 'package:flutter_app_wallet_management/res/theme.dart';

class TransactionAdd extends StatefulWidget {
  @override
  _TransactionAddState createState() => _TransactionAddState();
}

class _TransactionAddState extends State<TransactionAdd> {
  FocusNode _categoryFocusNode = FocusNode();
  FocusNode _amountFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return ThemeSwitchingArea(
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: buildAppBar(),
            body: GestureDetector(
              onTap: (){
                _categoryFocusNode.unfocus();
                _amountFocusNode.unfocus();
              },
              child: SingleChildScrollView(
                padding: EdgeInsets.all(kDefaultPadding * 0.75),
                child: Column(
                  children: [
                    SizedBox(
                      height: 100,
                    ),
                    Text(
                      "New Transaction",
                      style: TextStyle(
                        fontSize: 20
                      ),
                    ),
                    SizedBox(
                      height: 150,
                    ),
                    TransactionAddForm(
                      categoryFocusNode: _categoryFocusNode,
                      amountFocusNode: _amountFocusNode,
                    )
                  ],
                ),
              ),
            ),
          );
        }
      ),
    );
  }

  buildAppBar(){
    return AppBar(
      leading: Container(),
      actions: [
        ThemeSwitcher(
            builder: (context) {
              return IconButton(
                icon: Icon(
                  selectedTheme == 1 ? CupertinoIcons.moon_stars : CupertinoIcons.sun_max,
                  color: kPrimaryColor,
                ),
                onPressed: (){
                  final theme = selectedTheme == 1 ? darkThemeData(context) : lightThemeData(context);

                  print("pressed");
                  final switcher = ThemeSwitcher.of(context);
                  switcher.changeTheme(theme: theme);

                  selectedTheme = selectedTheme == 1 ? 2 : 1;
                },
              );
            }
        )
      ],
    );
  }
}
