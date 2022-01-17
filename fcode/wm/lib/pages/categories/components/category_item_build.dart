import 'package:flutter/material.dart';
import 'package:flutter_app_wallet_management/controllers/category_controller.dart';
import 'package:flutter_app_wallet_management/dialog/form_dialog.dart';
import 'package:flutter_app_wallet_management/dialog/yes_no_dialog.dart';
import 'package:flutter_app_wallet_management/models/category.dart';
import 'package:flutter_app_wallet_management/pages/categories/components/category_edit_form.dart';
import 'package:flutter_app_wallet_management/res/strings.dart';
import 'package:flutter_app_wallet_management/utils/navigation_page.dart';
import 'package:flutter_app_wallet_management/widgets/icon_button_widget.dart';

class CategoryItemBuild extends StatelessWidget {
  final BuildContext context;
  final Category data;
  final FocusNode nameFocusNode;
  final CategoryController controller;

  const CategoryItemBuild({
    Key key,
    this.context,
    this.data,
    this.nameFocusNode,
    this.controller
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        contentPadding: EdgeInsets.all(0),
        title: Text(
          data.name.toUpperCase(),
          style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w400
          ),
        ),
        subtitle: Text(
          // controller.typesList[data.typeId].name,
          controller.getTypeByTypeId(data.typeId),
          style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w400
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButtonWidget(
              icon: Icons.edit_outlined,
              onPress: (){
                showEditDialog(context, data);
              },
            ),
            IconButtonWidget(
              icon: Icons.delete_outline,
              onPress: (){
                showDeleteDialog(context, data);
              },
            ),
          ],
        )
    );
  }

  void showEditDialog(BuildContext context, Category data){
    // set type data initially
    controller.selectedType = controller.getTypeByTypeId(data.typeId);

    formDialog(
      context: context,
      title: editString+" "+categoryString,
      formWidget: CategoryEditForm(
        data: data,
        nameFocusNode: nameFocusNode,
        controller: controller,
      )
    );
  }

  void showDeleteDialog(BuildContext context, Category data) {
    yesNoDialog(
        context: context,
        title: deleteString + " " + categoryString,
        desMsg: deleteDialogMsgString,
        onContinue: () {
          controller.deleteObj(data);
          NavigationPage.pop(context);
        },
        onCancel: () => NavigationPage.pop(context)
    );
  }
}
