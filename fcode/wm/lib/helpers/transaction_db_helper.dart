import 'dart:io';

import 'package:flutter_app_wallet_management/models/transaction.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class TransactionDBHelper{
  static final TransactionDBHelper instance = TransactionDBHelper._instance();
  static Database _db;

  TransactionDBHelper._instance();

  String table = 'transaction_table';
  String colId = 'id';
  String colTypeId = 'typeId';
  String colCategoryId = 'categoryId';
  String colShortInfo = 'shortInfo';
  String colAmount = 'amount';
  String colDate = 'date';

  Future<Database> get db async {
    if (_db == null) {
      _db = await _initDb();
    }
    return _db;
  }

  Future<Database> _initDb() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = dir.path + 'wm_transaction.db';

    final todoListDb =
    await openDatabase(path, version: 1, onCreate: _createDb);
    return todoListDb;
  }

  void _createDb(Database db, int version) async {
    await db.execute(
      'CREATE TABLE $table($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colTypeId INTEGER, $colCategoryId INTEGER, $colShortInfo TEXT, $colAmount INTEGER, $colDate TEXT)',
    );
  }

  Future<List<Map<String, dynamic>>> getMapList() async {
    Database db = await this.db;
    final List<Map<String, dynamic>> result = await db.query(table);
    return result;
  }

  Future<List<TransactionModel>> getAllData() async {
    final List<Map<String, dynamic>> mapList = await getMapList();
    final List<TransactionModel> list = [];
    mapList.forEach((singleMap) {
      list.add(TransactionModel.fromMap(singleMap));
    });
    return list;
  }

  Future<int> insertData(TransactionModel passedData) async {
    Database db = await this.db;
    final int result = await db.insert(table, passedData.toMap());
    return result;
  }

  Future<int> updateData(TransactionModel passedData) async {
    Database db = await this.db;
    final int result = await db.update(table, passedData.toMap(),
        where: '$colId = ?', whereArgs: [passedData.id]);
    return result;
  }

  Future<int> deleteData(int id) async {
    Database db = await this.db;
    final int result = await db.delete(table, where: '$colId = ?', whereArgs: [id]);
    return result;
  }
}