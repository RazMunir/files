import 'package:flutter/material.dart';
import 'package:flutter_app_wallet_management/controllers/category_controller.dart';
import 'package:flutter_app_wallet_management/models/category.dart';
import 'package:flutter_app_wallet_management/res/dimensions.dart';
import 'package:flutter_app_wallet_management/utils/field_validator.dart';
import 'package:flutter_app_wallet_management/widgets/button_widget.dart';
import 'package:flutter_app_wallet_management/widgets/custom_form_dd_field_widget.dart';
import 'package:flutter_app_wallet_management/widgets/custom_form_field_widget.dart';

class CategoryAddForm extends StatelessWidget {
  final FocusNode nameFocusNode;
  final CategoryController controller;

  CategoryAddForm({
    Key key,
    this.nameFocusNode,
    this.controller
  }) : super(key: key);

  final TextEditingController _nameController = TextEditingController();
  final _categoryAddFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _categoryAddFormKey,
      child: Column(
        children: [
          CustomFormDDFieldWidget(
            label: "Type",
            hint: "Select type",
            valueList: controller.types,
            validator: (value) => FieldValidator.validateDDField(value: controller.selectedType),
            onChanged: (value) {
              controller.selectedType = value;
            },
          ),
          SizedBox(height: kDefaultPadding,),
          CustomFormFieldWidget(
            isLabelEnabled: false,
            keyboardType: TextInputType.text,
            inputAction: TextInputAction.done,
            label: 'Category',
            hint: 'Enter category',
            focusNode: nameFocusNode,
            controller: _nameController,
            validator: (value) => FieldValidator.validateField(value: value),
          ),
          SizedBox(height: kDefaultPadding,),
          ButtonWidget(
              text: "Add",
              press: (){
                nameFocusNode.unfocus();

                if (_categoryAddFormKey.currentState.validate()) {
                  controller.addObj(
                      Category(
                        typeId: controller.getSelectedTypeIndex(),
                        name: _nameController.text
                      )
                  );
                }
              }
          ),
        ],
      ),
    );
  }
}