import 'package:flutter/material.dart';
import 'package:flutter_app_wallet_management/controllers/transaction_controller.dart';
import 'package:flutter_app_wallet_management/pages/transactions/components/transaction_add_form.dart';
import 'package:flutter_app_wallet_management/res/dimensions.dart';
import 'package:flutter_app_wallet_management/res/strings.dart';

class TransactionAddPage extends StatelessWidget {

  final controller = TransactionController();
  final FocusNode _shortDesFocusNode = FocusNode();
  final FocusNode _amountFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    // init for getting types
    controller.getAllTypes();
    controller.getAllCategory();

    return Scaffold(
      appBar: buildAppBar(),
      body: AnimatedBuilder(
        animation: controller,
        builder: (context, _){
          return GestureDetector(
            onTap: (){
              _shortDesFocusNode.unfocus();
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
                    newString+" "+transactionString,
                    style: TextStyle(
                        fontSize: 20
                    ),
                  ),
                  SizedBox(
                    height: 150,
                  ),
                  TransactionAddForm(
                    shortDesFocusNode: _shortDesFocusNode,
                    amountFocusNode: _amountFocusNode,
                    controller: controller
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  buildAppBar(){
    return AppBar(
      leading: Builder(
          builder: (context) {
            return IconButton(
              icon: Icon(
                Icons.keyboard_backspace_sharp,
              ),
              onPressed: (){
                Navigator.pop(context);
              },
            );
          }
      ),
    );
  }
}
