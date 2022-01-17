import 'package:flutter/material.dart';
import 'package:flutter_app_wallet_management/controllers/type_controller.dart';
import 'package:flutter_app_wallet_management/models/type.dart';
import 'package:flutter_app_wallet_management/res/dimensions.dart';
import 'package:flutter_app_wallet_management/utils/field_validator.dart';
import 'package:flutter_app_wallet_management/widgets/button_widget.dart';
import 'package:flutter_app_wallet_management/widgets/custom_form_field_widget.dart';

class TypeAddForm extends StatelessWidget {
  final FocusNode nameFocusNode;
  final TypeController controller;

  TypeAddForm({
    Key key,
    this.nameFocusNode,
    this.controller
  }) : super(key: key);

  final TextEditingController _nameController = TextEditingController();
  final _typeAddFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _typeAddFormKey,
      child: Row(
        children: [
          Expanded(
            child: CustomFormFieldWidget(
              isLabelEnabled: false,
              keyboardType: TextInputType.text,
              inputAction: TextInputAction.done,
              label: 'Category',
              hint: 'Enter category',
              focusNode: nameFocusNode,
              controller: _nameController,
              validator: (value) => FieldValidator.validateField(value: value),
            ),
          ),
          SizedBox(width: kDefaultPadding,),
          ButtonWidget(
              text: "Add",
              size: 100,
              press: (){
                nameFocusNode.unfocus();

                if (_typeAddFormKey.currentState.validate()) {
                  controller.addObj(Type(name: _nameController.text));
                }
              }
          ),
        ],
      ),
    );
  }
}
