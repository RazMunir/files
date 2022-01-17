import 'package:flutter/material.dart';
import 'package:flutter_app_wallet_management/controllers/transaction_controller.dart';
import 'package:flutter_app_wallet_management/models/transaction.dart';
import 'package:flutter_app_wallet_management/pages/transactions/components/transaction_edit_form.dart';
import 'package:flutter_app_wallet_management/res/dimensions.dart';
import 'package:flutter_app_wallet_management/res/strings.dart';
import 'package:flutter_app_wallet_management/view_models/transaction_view_model.dart';

class TransactionEditPage extends StatelessWidget {
  final TransactionModel data;
  final TransactionViewModel dataViewModel;
  final TransactionController controller;

  TransactionEditPage({
    Key key,
    this.data,
    this.dataViewModel,
    this.controller
  }) : super(key: key);

  final FocusNode _shortDesFocusNode = FocusNode();
  final FocusNode _amountFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
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
                    editString+" "+transactionString,
                    style: TextStyle(
                        fontSize: 20
                    ),
                  ),
                  SizedBox(
                    height: 150,
                  ),
                  TransactionEditForm(
                    shortDesFocusNode: _shortDesFocusNode,
                    amountFocusNode: _amountFocusNode,
                    data: data,
                    dataViewModel: dataViewModel,
                    controller: controller,
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  buildAppBar(BuildContext context){
    return AppBar(
      leading: IconButton(
        icon: Icon(
          Icons.keyboard_backspace_sharp,
        ),
        onPressed: (){
          Navigator.pop(context);
        },
      )
    );
  }
}
