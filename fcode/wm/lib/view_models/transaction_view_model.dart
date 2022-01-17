import 'package:flutter_app_wallet_management/controllers/transaction_controller.dart';
import 'package:flutter_app_wallet_management/models/transaction.dart';

class TransactionViewModel{
  int id;
  String type;
  String category;
  String shortInfo;
  int amount;
  DateTime date;

  TransactionViewModel({
    this.id,
    this.type,
    this.category,
    this.shortInfo,
    this.amount,
    this.date
  });

  static TransactionViewModel convertToTransactionViewModel(TransactionModel data, String type, String category){
    return TransactionViewModel(
      id: data.id,
      type: type,
      category: category,
      shortInfo: data.shortInfo,
      amount: data.amount,
      date: data.date
    );
  }
}