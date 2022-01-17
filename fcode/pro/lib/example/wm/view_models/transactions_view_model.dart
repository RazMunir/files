import 'package:flutter_profile_app/example/wm/models/transactions.dart';
import 'package:flutter_profile_app/example/wm/utils/transactions_data_retrieve.dart';

class TransactionsViewModel {
  Transactions transactions;
  String type;
  String category;
  String account;
  String month;

  TransactionsViewModel({this.transactions, this.type, this.category, this.account, this.month});

  static TransactionsViewModel convertToTransactionsViewModel(Transactions transactions){
    return TransactionsViewModel(
      transactions: transactions,
      type: TransactionsDataRetrieve.typeList[transactions.type],
      category: TransactionsDataRetrieve.categoryList[transactions.category],
      account: TransactionsDataRetrieve.accountList[transactions.account],
      month: TransactionsDataRetrieve.monthList[transactions.month]
    );
    // id: json["_id"],
    // type: json["type"],
    // category: json["category"],
    // account: json["account"],
    // amount: json["amount"],
    // about: json["about"],
    // month: json["month"],
  }
}