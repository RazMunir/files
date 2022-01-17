import 'package:flutter/material.dart';
import 'package:flutter_app_wallet_management/helpers/type_db_helper.dart';
import 'package:flutter_app_wallet_management/models/type.dart';

class TypeController extends ChangeNotifier{
  List<Type> list = [];

  void addObj(Type obj){
    TypeDBHelper.instance.insertData(obj);
    notifyListeners();
  }

  Future<List<Type>> getAllData() async {
    list = await TypeDBHelper.instance.getAllData();
    return list;
  }

  void editObj(Type data){
    TypeDBHelper.instance.updateData(data);
    notifyListeners();
  }

  void deleteObj(Type data){
    TypeDBHelper.instance.deleteData(data.id);
    notifyListeners();
  }
}