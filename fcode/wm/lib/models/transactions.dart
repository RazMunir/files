// Transactions transactionsFromJson(String str) => Transactions.fromJson(json.decode(str));
//
// String transactionsToJson(Transactions data) => json.encode(data.toJson());

import 'package:intl/intl.dart';

class Transactions {
  Transactions({
    this.type,
    this.category,
    this.account,
    this.amount,
    this.about,
    this.month,
    this.date,
  });

  Transactions.withId({
    this.id,
    this.type,
    this.category,
    this.account,
    this.amount,
    this.about,
    this.month,
    this.date,
  });

  String id;
  int type;
  int category;
  int account;
  int amount;
  String about;
  int month;
  DateTime date;

  factory Transactions.fromJson(Map<String, dynamic> json) => Transactions.withId(
    id: json["_id"],
    type: json["type"],
    category: json["category"],
    account: json["account"],
    amount: json["amount"],
    about: json["about"],
    month: json["month"],
    // date: DateTime.parse(json["date"]),
    date: DateFormat("yyyy-MM-dd EEE hh:mm:ss a").parse(json["date"]),
  );

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = Map<String, dynamic>();
    if (id != null) {
      map['_id'] = id;
    }
    map["type"] = type;
    map["category"] = category;
    map["account"] = account;
    map["amount"] = amount;
    map["about"] = about;
    map["month"] = month;
    map["date"] = date.toIso8601String();

    return map;
  }
}
