import 'package:flutter/material.dart';
import 'package:flutter_app_wallet_management/controllers/transaction_controller.dart';
import 'package:flutter_app_wallet_management/models/transaction.dart';
import 'package:flutter_app_wallet_management/pages/transactions/components/date_picker_widget.dart';
import 'package:flutter_app_wallet_management/res/dimensions.dart';
import 'package:flutter_app_wallet_management/utils/field_validator.dart';
import 'package:flutter_app_wallet_management/utils/navigation_page.dart';
import 'package:flutter_app_wallet_management/widgets/button_widget.dart';
import 'package:flutter_app_wallet_management/widgets/custom_form_dd_field_widget.dart';
import 'package:flutter_app_wallet_management/widgets/custom_form_field_widget.dart';
import 'package:flutter_app_wallet_management/wm_main.dart';

class TransactionAddForm extends StatelessWidget {
  final FocusNode shortDesFocusNode;
  final FocusNode amountFocusNode;
  final TransactionController controller;

  TransactionAddForm({
    Key key,
    this.shortDesFocusNode,
    this.amountFocusNode,
    this.controller
  }) : super(key: key);

  final TextEditingController _shortDesController = TextEditingController(text: typedDes);
  final TextEditingController _amountController = TextEditingController(text: typedAmount);
  final _transactionAddFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _transactionAddFormKey,
      child: Column(
        children: [
          CustomFormDDFieldWidget(
            label: "Type",
            hint: "Select type",
            value: controller.selectedType,
            valueList: controller.types,
            validator: (value) => FieldValidator.validateDDField(value: controller.selectedType),
            onChanged: (value) {
              controller.selectedType = value;
              controller.getAllCategoryByType();
            },
          ),
          SizedBox(height: kDefaultPadding,),
          CustomFormDDFieldWidget(
            label: "Category",
            hint: "Select category",
            valueList: controller.categories,
            value: controller.selectedCategory,
            validator: (value) => FieldValidator.validateDDField(value: controller.selectedType),
            onChanged: (value) {
              controller.selectedCategory = value;
            },
          ),
          SizedBox(height: kDefaultPadding,),
          CustomFormFieldWidget(
            isLabelEnabled: false,
            keyboardType: TextInputType.text,
            inputAction: TextInputAction.next,
            label: 'ShortDes',
            hint: 'Write short description',
            focusNode: shortDesFocusNode,
            controller: _shortDesController,
            validator: (value) => FieldValidator.validateField(value: value),
            onChange: (value){
              typedDes = value;
            },
          ),
          SizedBox(height: kDefaultPadding,),
          CustomFormFieldWidget(
            isLabelEnabled: false,
            keyboardType: TextInputType.text,
            inputAction: TextInputAction.next,
            label: 'Amount',
            hint: 'Enter amount',
            focusNode: amountFocusNode,
            controller: _amountController,
            validator: (value) => FieldValidator.validateField(value: value),
            onChange: (value){
              typedAmount = value;
            },
          ),
          SizedBox(height: kDefaultPadding,),
          DatePickerWidget(controller: controller,),
          SizedBox(height: kDefaultPadding,),
          ButtonWidget(
            text: "Add",
            press: (){
              shortDesFocusNode.unfocus();
              amountFocusNode.unfocus();

              if (_transactionAddFormKey.currentState.validate()) {
                controller.addObj(
                  TransactionModel(
                      typeId: controller.getSelectedTypeIndex(),
                      categoryId: controller.getSelectedCategoryIndex(),
                      shortInfo: _shortDesController.text,
                      amount: int.parse(_amountController.text),
                      date: controller.selectedDate
                  )
                );
                NavigationPage.pop(context);
                // NavigationPage.push(context, WMMain());
              }
            }
          ),
        ],
      ),
    );
  }
}
