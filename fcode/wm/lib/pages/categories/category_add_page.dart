import 'package:flutter/material.dart';
import 'package:flutter_app_wallet_management/controllers/category_controller.dart';
import 'package:flutter_app_wallet_management/pages/categories/components/category_add_form.dart';
import 'package:flutter_app_wallet_management/pages/categories/components/category_item_build.dart';
import 'package:flutter_app_wallet_management/res/dimensions.dart';
import 'package:flutter_app_wallet_management/res/strings.dart';

class CategoryAddPage extends StatelessWidget {
  final controller = CategoryController();
  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _nameEditFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    // init for getting types
    controller.getAllTypes();

    return Scaffold(
      body: AnimatedBuilder(
        animation: controller,
        builder: (context, _){
          return GestureDetector(
            onTap: (){
              _nameFocusNode.unfocus();
            },
            child: SingleChildScrollView(
              padding: EdgeInsets.all(kDefaultPadding * 0.75),
              child: Column(
                children: [
                  SizedBox(height: kDefaultPadding,),
                  CategoryAddForm(
                    nameFocusNode: _nameFocusNode,
                    controller: controller,
                  ),
                  SizedBox(height: kDefaultPadding,),
                  FutureBuilder(
                    future: controller.getAllData(),
                    builder: (context, snapshot){
                      if (!snapshot.hasData) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return controller.list.isEmpty
                          ? Center(
                              child: Text(noDataMsgString),
                            )
                          : ListView.builder(
                              itemCount: controller.list.length,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return CategoryItemBuild(
                                  context: context,
                                  data: controller.list[index],
                                  nameFocusNode: _nameEditFocusNode,
                                  controller: controller,
                                );
                              },
                            );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}