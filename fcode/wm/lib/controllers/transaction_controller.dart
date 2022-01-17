import 'package:flutter/material.dart';
import 'package:flutter_app_wallet_management/controllers/category_controller.dart';
import 'package:flutter_app_wallet_management/controllers/type_controller.dart';
import 'package:flutter_app_wallet_management/helpers/transaction_db_helper.dart';
import 'package:flutter_app_wallet_management/models/category.dart';
import 'package:flutter_app_wallet_management/models/transaction.dart';
import 'package:flutter_app_wallet_management/models/type.dart';
import 'package:flutter_app_wallet_management/res/strings.dart';
import 'package:flutter_app_wallet_management/view_models/transaction_view_model.dart';


// for amount & info
String typedDes, typedAmount;

class TransactionController extends ChangeNotifier{
  // all total
  int totalDebit = 0, totalCredit = 0, total = 0;

  // type
  TypeController typeController = TypeController();
  List<Type> typesList = [];
  List<String> types = [];
  String selectedType;

  // category
  CategoryController categoryController = CategoryController();
  List<Category> categoryList = [];
  List<String> categories = [];
  String selectedCategory;

  // date
  DateTime selectedDate = DateTime.now();

  List<TransactionModel> list = [];
  List<TransactionModel> listDebit = [];
  List<TransactionModel> listCredit = [];
  List<TransactionViewModel> listViewModel = [];
  List<TransactionViewModel> listViewModelDebit = [];
  List<TransactionViewModel> listViewModelCredit = [];



  // db helper
  Future<List<TransactionModel>> getAllDataDbQuery(){
    return TransactionDBHelper.instance.getAllData();
  }

  Future<List<TransactionViewModel>> getAllData() async {
    resetList();
    list = await getAllDataDbQuery();
    for (int i = 0; i<list.length; i++){
      listViewModel.add(TransactionViewModel.convertToTransactionViewModel(list[i], getTypeNameById(list[i].typeId), getCategoryNameById(list[i].categoryId)));
      totalingAmount(list[i].amount, getTypeNameById(list[i].typeId));
    }
    return listViewModel;
  }

  Future<List<TransactionViewModel>> getAllDataForWmMain() async {
    resetList();
    resetTotal();
    getAllTypes();
    getAllCategory();
    list = await getAllDataDbQuery();
    for (int i = 0; i<list.length; i++){
      listViewModel.add(TransactionViewModel.convertToTransactionViewModel(list[i], getTypeNameById(list[i].typeId), getCategoryNameById(list[i].categoryId)));
      totalingAmount(list[i].amount, getTypeNameById(list[i].typeId));
      if(listViewModel[i].type.contains(expenseString)){
        listDebit.add(list[i]);
        listViewModelDebit.add(TransactionViewModel.convertToTransactionViewModel(list[i], getTypeNameById(list[i].typeId), getCategoryNameById(list[i].categoryId)));
      } else if(listViewModel[i].type.contains(depositString)){
        listCredit.add(list[i]);
        listViewModelCredit.add(TransactionViewModel.convertToTransactionViewModel(list[i], getTypeNameById(list[i].typeId), getCategoryNameById(list[i].categoryId)));
      }
    }
    return listViewModel;
  }

  Future<List<TransactionViewModel>> getAllDataByType(String type) async {
    resetList();
    list = await getAllDataDbQuery();
    for (int i = 0; i<list.length; i++){
      if(type.contains(getTypeNameById(list[i].typeId))){
        listViewModel.add(TransactionViewModel.convertToTransactionViewModel(list[i], getTypeNameById(list[i].typeId), getCategoryNameById(list[i].categoryId)));
        totalingAmount(list[i].amount, getTypeNameById(list[i].typeId));
      }
    }
    return listViewModel;
  }

  void totalingAmount(int amount, String type){
    total = total + amount;
    switch(type){
      case "Credit":
        totalCredit +=amount;
        break;
      case "Debit":
        totalDebit +=amount;
        break;
    }
  }

  void resetList(){
    list = [];
    listDebit = [];
    listCredit = [];
    listViewModel = [];
    listViewModelDebit = [];
    listViewModelCredit = [];
  }

  void resetTotal(){
    total = 0;
    totalDebit = 0;
    totalCredit = 0;
  }

  void resetTypeCategoryList(){
    typesList = [];
    categoryList = [];

    // used for solving error occured in home screen when editing transaction
    types = [];
    categories = [];
  }

  void calculationTotal(TransactionModel data){
    if(getCategoryNameById(data.typeId).contains("Debit")){
      totalDebit = totalDebit + data.amount;
    } else if(getCategoryNameById(data.typeId).contains("Credit")){
      totalCredit = totalCredit + data.amount;
    }
  }

  void addObj(TransactionModel obj){
    TransactionDBHelper.instance.insertData(obj);
    notifyListeners();
  }

  void editObj(TransactionModel data){
    TransactionDBHelper.instance.updateData(data);
    notifyListeners();
  }

  void deleteObj(TransactionModel data){
    TransactionDBHelper.instance.deleteData(data.id);
    notifyListeners();
  }



  // type
  void getAllTypes() async{
    resetTypeCategoryList();
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

  void updateSelectedType(String value){
    selectedType = value;
    notifyListeners();
  }

  String getTypeNameById(int id){
    for(int i = 0; i<typesList.length; i++){
      if(typesList[i].id == id){
        return typesList[i].name;
      }
    }
    return "";
  }



  // category
  void getAllCategory() async{
    categoryList = await categoryController.getAllData();
    for(int i =0; i<categoryList.length; i++){
      categories.add(categoryList[i].name);
    }
    notifyListeners();
  }

  void getAllCategoryByType(){
    int index = getSelectedTypeIndex();
    categories = [];
    for(int i = 0; i<categoryList.length; i++){
      if(categoryList[i].typeId == index){
        categories.add(categoryList[i].name);
      }
    }
    notifyListeners();
  }

  int getSelectedCategoryIndex(){
    for(int i = 0; i< categoryList.length; i++){
      if(categoryList[i].name.contains(selectedCategory)){
        return categoryList[i].id;
      }
    }
    return 0;
  }

  String getCategoryNameById(int id){
    for(int i = 0; i<categoryList.length; i++){
      if(categoryList[i].id == id){
        return categoryList[i].name;
      }
    }
    return "";
  }



  // date picker
  void updatePickedDate(DateTime pickedDate){
    selectedDate = pickedDate;
    notifyListeners();
  }


  // clear data of input text field
  void clearInputTextFields(){
    typedDes = "";
    typedAmount = "";
  }
}