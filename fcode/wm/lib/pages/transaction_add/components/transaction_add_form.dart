import 'package:flutter/material.dart';
import 'package:flutter_app_wallet_management/res/dimensions.dart';
import 'package:flutter_app_wallet_management/utils/field_validator.dart';
import 'package:flutter_app_wallet_management/widgets/button_widget.dart';
import 'package:flutter_app_wallet_management/widgets/custom_form_dd_field_widget.dart';
import 'package:flutter_app_wallet_management/widgets/custom_form_field_widget.dart';

class TransactionAddForm extends StatefulWidget {
  final FocusNode categoryFocusNode;
  final FocusNode amountFocusNode;

  const TransactionAddForm({
    Key key,
    this.categoryFocusNode,
    this.amountFocusNode
  }) : super(key: key);

  @override
  _TransactionAddFormState createState() => _TransactionAddFormState();
}

class _TransactionAddFormState extends State<TransactionAddForm> {
  TextEditingController _categoryController = TextEditingController();
  TextEditingController _amountController = TextEditingController();

  final _transactionAddFormKey = GlobalKey<FormState>();

  // for dropdown
  final List<String> _types = ["Deposit", "Expanse"];
  String _type;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _transactionAddFormKey,
      child: Column(
        children: [
          CustomFormDDFieldWidget(
            label: "Type",
            hint: "Select type",
            valueList: _types,
            validator: (value) => FieldValidator.validateDDField(value: _type),
            onChanged: (value) {
              setState(() {
                _type = value;
              });
              print(_type);
            },
          ),
          SizedBox(height: kDefaultPadding,),
          CustomFormFieldWidget(
            isLabelEnabled: false,
            keyboardType: TextInputType.text,
            inputAction: TextInputAction.next,
            label: 'Category',
            hint: 'Enter category',
            focusNode: widget.categoryFocusNode,
            controller: _categoryController,
            validator: (value) => FieldValidator.validateField(value: value),
          ),
          SizedBox(height: kDefaultPadding,),
          CustomFormFieldWidget(
            isLabelEnabled: false,
            keyboardType: TextInputType.number,
            inputAction: TextInputAction.done,
            label: 'Amount',
            hint: 'Enter amount',
            focusNode: widget.amountFocusNode,
            controller: _amountController,
            validator: (value) => FieldValidator.validateField(value: value),
          ),
          SizedBox(height: 20,),
          ButtonWidget(
            text: "Add",
            press: (){
              widget.categoryFocusNode.unfocus();
              widget.amountFocusNode.unfocus();

              if (_transactionAddFormKey.currentState.validate()) {
                print('Form is validated');
              }
            }
          ),
        ],
      ),
    );
  }
}
