import 'package:flutter/material.dart';
import 'package:flutter_app_wallet_management/controllers/transaction_controller.dart';
import 'package:flutter_app_wallet_management/models/transaction.dart';
import 'package:flutter_app_wallet_management/res/strings.dart';
import 'package:flutter_app_wallet_management/screens/widgets/build_item_widget.dart';
import 'package:flutter_app_wallet_management/screens/widgets/text_widget.dart';

class HomeScreen extends StatelessWidget {
  final TransactionController controller;

  const HomeScreen({Key key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20).copyWith(bottom: 0, top: 0),
      child: SingleChildScrollView(
        child: controller.list.isEmpty
            ? Center(
                child: Text(noDataMsgString),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 55.0,
                          width: 55.0,
                          child: CircularProgressIndicator(
                            value: 70 / 100,
                            strokeWidth: 4,
                            valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFFF7E7E)),
                            backgroundColor: Colors.grey[200],
                          ),
                        ),
                        SizedBox(
                          width: 25.0,
                        ),
                        Column(
                          children: [
                            TextWidget(text: "Deposit: \$${controller.totalCredit}",),
                            SizedBox(
                              height: 10.0,
                            ),
                            TextWidget(text: "Expanse: \$${controller.totalDebit}",),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Divider()
                  ),
                  Container(
                    child: Text(
                      "All Expanses",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          letterSpacing: 2,
                          fontWeight: FontWeight.w400
                      ),
                    ),
                  ),
                  Container(
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: controller.list.length,
                      itemBuilder: (context, index){
                        return BuildItemWidget(
                          index: index,
                          data: controller.listViewModel[index],
                          controller: controller,
                        );
                      },
                    ),
                  ),
                ],
              )
      ),
    );
  }
}

