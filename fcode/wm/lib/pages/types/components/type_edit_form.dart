import 'package:flutter/material.dart';
import 'package:flutter_app_wallet_management/controllers/type_controller.dart';
import 'package:flutter_app_wallet_management/models/type.dart';
import 'package:flutter_app_wallet_management/res/dimensions.dart';
import 'package:flutter_app_wallet_management/res/strings.dart';
import 'package:flutter_app_wallet_management/utils/field_validator.dart';
import 'package:flutter_app_wallet_management/utils/navigation_page.dart';
import 'package:flutter_app_wallet_management/widgets/button_widget.dart';
import 'package:flutter_app_wallet_management/widgets/custom_form_field_widget.dart';

class TypeEditForm extends StatelessWidget {
  final Type data;
  final FocusNode nameFocusNode;
  final TypeController controller;

  final TextEditingController _nameController = TextEditingController();
  final _typeEditFormKey = GlobalKey<FormState>();

  TypeEditForm({
    Key key,
    this.data,
    this.nameFocusNode,
    this.controller
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _nameController.text = data.name;

    return Form(
      key: _typeEditFormKey,
      child: Column(
        children: [
          CustomFormFieldWidget(
            isLabelEnabled: false,
            keyboardType: TextInputType.text,
            inputAction: TextInputAction.next,
            label: 'Category',
            hint: 'Enter category',
            focusNode: nameFocusNode,
            controller: _nameController,
            validator: (value) => FieldValidator.validateField(value: value),
          ),
          SizedBox(height: kDefaultPadding,),
          ButtonWidget(
              text: editString,
              press: (){
                nameFocusNode.unfocus();

                if (_typeEditFormKey.currentState.validate()) {
                  data.name = _nameController.text;
                  controller.editObj(data);
                  NavigationPage.pop(context);
                }
              }
          )
        ],
      ),
    );
  }
}
