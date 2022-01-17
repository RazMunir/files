import 'package:flutter_profile_app/example/wm/models/transactions.dart';
import 'package:flutter_profile_app/example/wm/view_models/transactions_view_model.dart';

class TransactionsTotalViewModel{
  List<Transactions> transactionsList;
  List<TransactionsViewModel> transactionsViewModelList;
  int totalDeposit;
  int totalExpanse;

  TransactionsTotalViewModel({
    this.transactionsList,
    this.transactionsViewModelList,
    this.totalDeposit,
    this.totalExpanse
  });

  void totalingAmount(int type, int amount){
    switch(type) {
      case 0:
        this.totalDeposit = this.totalDeposit + amount;
        break;
      default:
        this.totalExpanse = this.totalExpanse + amount;
        break;
    }
  }
}