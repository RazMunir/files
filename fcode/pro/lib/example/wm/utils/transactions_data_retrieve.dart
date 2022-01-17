import 'package:flutter_profile_app/example/wm/data/dummy_data.dart';
import 'package:flutter_profile_app/example/wm/models/transactions.dart';
import 'package:flutter_profile_app/example/wm/view_models/transactions_view_model.dart';
import 'package:flutter_profile_app/example/wm/view_models/transactions_total_view_model.dart';

class TransactionsDataRetrieve{
  // from dummy data
  static var response = transactionsData;
  static var typeList = type;
  static var accountList = account;
  static var categoryList = category;
  static var monthList = month;

  // setting data
  static List<Map<String, dynamic>> transactionsJson;
  static List<Transactions> transactionsList;
  static List<TransactionsViewModel> transactionsViewModelList;
  static TransactionsTotalViewModel transactionsTotalViewModel;

  static List<Map<String, dynamic>> init(){
    return response["transactions"];
  }

  static Future<TransactionsTotalViewModel> getTransactionsList() async {
    transactionsJson = init();
    transactionsList = [];
    transactionsViewModelList = [];
    transactionsTotalViewModel = TransactionsTotalViewModel( totalDeposit: 0, totalExpanse: 0);

    for(int i = 0; i < transactionsJson.length; i++){
      transactionsList.add(Transactions.fromJson(transactionsJson[i]));
      transactionsViewModelList.add(TransactionsViewModel.convertToTransactionsViewModel(transactionsList[i]));
      transactionsTotalViewModel.totalingAmount(transactionsList[i].type, transactionsList[i].amount);
    }
    transactionsTotalViewModel = TransactionsTotalViewModel(
        transactionsList: transactionsList,
        transactionsViewModelList: transactionsViewModelList,
        totalDeposit: transactionsTotalViewModel.totalDeposit,
        totalExpanse: transactionsTotalViewModel.totalExpanse
    );
    // return transactionsViewModelList;
    return transactionsTotalViewModel;
  }
}