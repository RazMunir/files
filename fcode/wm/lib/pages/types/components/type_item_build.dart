import 'package:flutter/material.dart';
import 'package:flutter_app_wallet_management/controllers/type_controller.dart';
import 'package:flutter_app_wallet_management/dialog/form_dialog.dart';
import 'package:flutter_app_wallet_management/dialog/yes_no_dialog.dart';
import 'package:flutter_app_wallet_management/models/type.dart';
import 'package:flutter_app_wallet_management/pages/types/components/type_edit_form.dart';
import 'package:flutter_app_wallet_management/res/colors.dart';
import 'package:flutter_app_wallet_management/res/dimensions.dart';
import 'package:flutter_app_wallet_management/res/strings.dart';
import 'package:flutter_app_wallet_management/utils/navigation_page.dart';
import 'package:flutter_app_wallet_management/widgets/icon_button_widget.dart';

class TypeItemBuild extends StatelessWidget {
  final BuildContext context;
  final Type data;
  final FocusNode nameFocusNode;
  final TypeController controller;

  const TypeItemBuild({
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

  void showEditDialog(BuildContext context, Type data){
    formDialog(
      context: context,
      title: editString+" "+typeString,
      formWidget: TypeEditForm(
        data: data,
        nameFocusNode: nameFocusNode,
        controller: controller,
      )
    );
  }

  void showDeleteDialog(BuildContext context, Type data) {
    yesNoDialog(
        context: context,
        title: deleteString + " " + typeString,
        desMsg: deleteDialogMsgString,
        onContinue: () {
          controller.deleteObj(data);
          NavigationPage.pop(context);
        },
        onCancel: () => NavigationPage.pop(context)
    );
  }
}
