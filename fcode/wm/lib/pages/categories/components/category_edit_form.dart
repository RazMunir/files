import 'package:flutter/material.dart';
import 'package:flutter_app_wallet_management/controllers/category_controller.dart';
import 'package:flutter_app_wallet_management/models/category.dart';
import 'package:flutter_app_wallet_management/res/dimensions.dart';
import 'package:flutter_app_wallet_management/res/strings.dart';
import 'package:flutter_app_wallet_management/utils/field_validator.dart';
import 'package:flutter_app_wallet_management/utils/navigation_page.dart';
import 'package:flutter_app_wallet_management/widgets/button_widget.dart';
import 'package:flutter_app_wallet_management/widgets/custom_form_dd_field_widget.dart';
import 'package:flutter_app_wallet_management/widgets/custom_form_field_widget.dart';

class CategoryEditForm extends StatelessWidget {
  final Category data;
  final FocusNode nameFocusNode;
  final CategoryController controller;

  final TextEditingController _nameController = TextEditingController();
  final _categoryEditFormKey = GlobalKey<FormState>();

  CategoryEditForm({
    Key key,
    this.data,
    this.nameFocusNode,
    this.controller
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _nameController.text = data.name;

    return Form(
      key: _categoryEditFormKey,
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
              text: editString,
              press: (){
                nameFocusNode.unfocus();

                if (_categoryEditFormKey.currentState.validate()) {
                  data.typeId = controller.getSelectedTypeIndex();
                  data.name = _nameController.text;
                  controller.editObj(data);
                  NavigationPage.pop(context);
                }
              }
          ),
        ],
      ),
    );
  }
}
