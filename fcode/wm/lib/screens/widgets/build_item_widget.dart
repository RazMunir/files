import 'package:flutter/material.dart';
import 'package:flutter_app_wallet_management/controllers/transaction_controller.dart';
import 'package:flutter_app_wallet_management/dialog/form_dialog.dart';
import 'package:flutter_app_wallet_management/dialog/yes_no_dialog.dart';
import 'package:flutter_app_wallet_management/pages/transactions/transaction_edit_page.dart';
import 'package:flutter_app_wallet_management/res/dimensions.dart';
import 'package:flutter_app_wallet_management/res/strings.dart';
import 'package:flutter_app_wallet_management/screens/widgets/transaction_dialog_edit_form.dart';
import 'package:flutter_app_wallet_management/utils/navigation_page.dart';
import 'package:flutter_app_wallet_management/view_models/transaction_view_model.dart';
import 'package:flutter_app_wallet_management/widgets/button_widget.dart';
import 'package:intl/intl.dart';

class BuildItemWidget extends StatelessWidget {
  final int index;
  final TransactionViewModel data;
  final TransactionController controller;

  const BuildItemWidget({
    Key key,
    this.index,
    this.data,
    this.controller
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        NavigationPage.push(
          context,
          TransactionEditPage(
            data: controller.list[index],
            dataViewModel: controller.listViewModel[index],
            controller: controller,
          )
        );
      },
      onLongPress: (){
        formDialog(
          context: context,
          title: optionDialogMsgString.toUpperCase(),
          formWidget: actionButtons(context)
        );
      },
      child: ListTile(
        contentPadding: EdgeInsets.all(0),
        leading: CircleAvatar(
          backgroundColor: Color(0xFFFF7E7E),
          radius: 20,
          child: Icon(
            Icons.emoji_transportation_outlined,
            color: Colors.white,
          ),
        ),
        title: Text(
          data.category.toUpperCase(),
          style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w400
          ),
        ),
        subtitle: Text(
          data.type.toUpperCase()+ " - " + DateFormat.yMMMEd().format(data.date),
          style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w300
          ),
        ),
        trailing: Text(
          "Tk ${data.amount}",
          style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w400
          ),
        ),
      ),
    );
  }

  Widget actionButtons(BuildContext context){
    return Column(
      children: [
        ButtonWidget(
          text: editString,
          press: (){
            NavigationPage.pop(context);

            formDialog(
              context: context,
              title: editString+" "+transactionString,
              formWidget: TransactionDialogEditForm(
                data: controller.list[index],
                dataViewModel: controller.listViewModel[index],
                controller: controller,
              )
            );
          },
        ),
        SizedBox(height: kDefaultPadding,),
        ButtonWidget(
          text: deleteString,
          press: () => showDeleteDialog(context),
        )
      ],
    );
  }

  void showDeleteDialog(BuildContext context){
    NavigationPage.pop(context);

    yesNoDialog(
        context: context,
        title: deleteString+" "+transactionString,
        desMsg: deleteDialogMsgString,
        onContinue: (){
          controller.deleteObj(controller.list[index]);
          NavigationPage.pop(context);
        },
        onCancel: () => NavigationPage.pop(context)
    );
  }
}
