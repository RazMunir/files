import 'package:intl/intl.dart';

class TransactionModel{
  int id;
  int typeId;
  int categoryId;
  String shortInfo;
  int amount;
  DateTime date;

  TransactionModel({
    this.typeId,
    this.categoryId,
    this.shortInfo,
    this.amount,
    this.date
  });

  TransactionModel.withId({
    this.id,
    this.typeId,
    this.categoryId,
    this.shortInfo,
    this.amount,
    this.date
  });

  Map<String, dynamic> toMap() {
    final map = Map<String, dynamic>();

    if (id != null) {
      map['id'] = id;
    }
    map['typeId'] = typeId;
    map['categoryId'] = categoryId;
    map['shortInfo'] = shortInfo;
    map['amount'] = amount;
    map['date'] = date.toIso8601String();

    return map;
  }

  factory TransactionModel.fromMap(Map<String, dynamic> map) {
    return TransactionModel.withId(
      id: map['id'],
      typeId: map['typeId'],
      categoryId: map['categoryId'],
      shortInfo: map['shortInfo'],
      amount: map['amount'],
      // date: DateFormat("yyyy-MM-dd EEE hh:mm:ss a").parse(map['date']),
      date: DateTime.parse(map['date'])
    );
  }
}