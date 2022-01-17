import 'package:flutter/material.dart';
import 'package:flutter_app_wallet_management/controllers/type_controller.dart';
import 'package:flutter_app_wallet_management/helpers/category_db_helper.dart';
import 'package:flutter_app_wallet_management/models/category.dart';
import 'package:flutter_app_wallet_management/models/type.dart';

class CategoryController extends ChangeNotifier{
  // List<String> types = ["Deposit", "Expanse"];
  TypeController typeController = TypeController();
  List<Type> typesList = [];
  List<String> types = [];
  String selectedType;

  List<Category> list = [];

  void addObj(Category obj){
    CategoryDBHelper.instance.insertData(obj);
    notifyListeners();
  }

  void getAllTypes() async{
    typesList = await typeController.getAllData();
    for(int i =0; i<typesList.length; i++){
      types.add(typesList[i].name);
    }
    notifyListeners();
  }

  int getSelectedTypeIndex(){
    for(int i = 0; i< typesList.length; i++){
      if(typesList[i].name.contains(selectedType)){
        return typesList[i].id;
      }
    }
    return 0;
  }

  Future<List<Category>> getAllData() async {
    list = await CategoryDBHelper.instance.getAllData();
    return list;
  }

  void editObj(Category data){
    CategoryDBHelper.instance.updateData(data);
    notifyListeners();
  }

  void deleteObj(Category data){
    CategoryDBHelper.instance.deleteData(data.id);
    notifyListeners();
  }

  void changeSelectedType(String value){
    selectedType = value;
    notifyListeners();
  }

  String getTypeByTypeId(int id){
    for(int i=0; i<=typesList.length; i++){
      if(typesList[i].id == id){
        return typesList[i].name;
      }
    }
    return typesList[0].name;
  }
}