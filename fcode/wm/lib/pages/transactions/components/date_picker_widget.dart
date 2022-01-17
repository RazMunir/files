import 'package:flutter/material.dart';
import 'package:flutter_app_wallet_management/controllers/transaction_controller.dart';
import 'package:flutter_app_wallet_management/res/colors.dart';
import 'package:flutter_app_wallet_management/res/dimensions.dart';
import 'package:flutter_app_wallet_management/res/strings.dart';
import 'package:intl/intl.dart';

class DatePickerWidget extends StatelessWidget {
  final TransactionController controller;

  const DatePickerWidget({
    Key key,
    this.controller
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            controller.selectedDate == null
                ? 'No Date chosen'
                : DateFormat.yMMMEd().format(controller.selectedDate),
            style: TextStyle(
              // fontSize: 15.0,
              letterSpacing: 1,
            ),
          ),
          TextButton(
            onPressed: () {
              _presentDatePicker(context);
            },
            child: Text(
              'Change Date',
              style: TextStyle(
                letterSpacing: 1,
                color: kPrimaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _presentDatePicker(BuildContext context) {
    showDatePicker(
      helpText: 'Transaction Date',
      confirmText: yesString.toUpperCase()+'!',
      cancelText: noString.toUpperCase()+'!',
      context: context,
      initialDate: controller.selectedDate,
      firstDate: DateTime(2021,11),
      lastDate: DateTime(2022, 11)
      // firstDate: DateTime.now().subtract(
      //   Duration(days: 7),
      // ),
      // lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      controller.updatePickedDate(pickedDate);
    });
  }
}
