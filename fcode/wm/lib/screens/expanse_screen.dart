import 'package:flutter/material.dart';
import 'package:flutter_app_wallet_management/controllers/transaction_controller.dart';
import 'package:flutter_app_wallet_management/res/strings.dart';
import 'package:flutter_app_wallet_management/screens/widgets/build_item_widget.dart';
import 'package:flutter_app_wallet_management/screens/widgets/text_widget.dart';
import 'package:flutter_app_wallet_management/view_models/transaction_view_model.dart';

class ExpanseScreen extends StatelessWidget {
  final TransactionController controller;

  const ExpanseScreen({Key key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.getAllTypes();
    controller.getAllCategory();

    return Container(
      padding: EdgeInsets.all(20).copyWith(bottom: 0),
      child: SingleChildScrollView(
        child: controller.listViewModelDebit.isEmpty
            ? Center(
                child: Text(noDataMsgString),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 25),
                    child: TextWidget(text: "Total Debit: \$${controller.totalDebit}",),
                  ),
                  Container(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Divider()),
                  Container(
                    child: Text(
                      "All Debits",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          letterSpacing: 2,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  Container(
                    child: ListView.builder(
                      itemCount: controller.listViewModelDebit.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return BuildItemWidget(data: controller.listViewModelDebit[index]);
                      },
                    ),
                  ),
                ],
              )
      )
    );
  }
}
