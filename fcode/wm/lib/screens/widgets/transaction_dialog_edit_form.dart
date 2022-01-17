import 'package:flutter/material.dart';
import 'package:flutter_app_wallet_management/controllers/transaction_controller.dart';
import 'package:flutter_app_wallet_management/models/transaction.dart';
import 'package:flutter_app_wallet_management/pages/transactions/components/date_picker_widget.dart';
import 'package:flutter_app_wallet_management/res/dimensions.dart';
import 'package:flutter_app_wallet_management/res/strings.dart';
import 'package:flutter_app_wallet_management/utils/field_validator.dart';
import 'package:flutter_app_wallet_management/utils/navigation_page.dart';
import 'package:flutter_app_wallet_management/view_models/transaction_view_model.dart';
import 'package:flutter_app_wallet_management/widgets/button_widget.dart';
import 'package:flutter_app_wallet_management/widgets/custom_form_dd_field_widget.dart';
import 'package:flutter_app_wallet_management/widgets/custom_form_field_widget.dart';

class TransactionDialogEditForm extends StatelessWidget {
  final TransactionModel data;
  final TransactionViewModel dataViewModel;
  final TransactionController controller;

  TransactionDialogEditForm({
    Key key,
    this.data,
    this.dataViewModel,
    this.controller
  }) : super(key: key);

  final _transactionEditFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final TextEditingController _shortDesController = TextEditingController(text: dataViewModel.shortInfo);
    final TextEditingController _amountController = TextEditingController(text: dataViewModel.amount.toString());
    controller.selectedDate = dataViewModel.date;
    controller.selectedType = dataViewModel.type;
    controller.selectedCategory = dataViewModel.category;
    controller.selectedDate = dataViewModel.date;

    return Form(
      key: _transactionEditFormKey,
      child: Column(
        children: [
          CustomFormDDFieldWidget(
            label: "Type",
            hint: "Select type",
            valueList: controller.types,
            value: controller.selectedType,
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
            controller: _shortDesController,
            validator: (value) => FieldValidator.validateField(value: value),
          ),
          SizedBox(height: kDefaultPadding,),
          CustomFormFieldWidget(
            isLabelEnabled: false,
            keyboardType: TextInputType.text,
            inputAction: TextInputAction.next,
            label: 'Amount',
            hint: 'Enter amount',
            controller: _amountController,
            validator: (value) => FieldValidator.validateField(value: value),
          ),
          // SizedBox(height: kDefaultPadding,),
          // DatePickerWidget(controller: controller,),
          SizedBox(height: kDefaultPadding,),
          ButtonWidget(
            text: editString,
            press: (){
              if(_transactionEditFormKey.currentState.validate()){
                print("validated");
                data.typeId = controller.getSelectedTypeIndex();
                data.categoryId = controller.getSelectedCategoryIndex();
                data.shortInfo = _shortDesController.text;
                data.amount = int.parse(_amountController.text);
                data.date = controller.selectedDate;

                controller.editObj(data);
                NavigationPage.pop(context);
              }
            },
          )
        ],
      ),
    );
  }
}
