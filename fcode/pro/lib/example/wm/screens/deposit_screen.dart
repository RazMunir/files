import 'package:flutter/material.dart';
import 'package:flutter_profile_app/example/wm/utils/transactions_data_retrieve.dart';
import 'package:flutter_profile_app/example/wm/view_models/transactions_view_model.dart';

class DepositScreen extends StatefulWidget {
  @override
  _DepositScreenState createState() => _DepositScreenState();
}

class _DepositScreenState extends State<DepositScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20).copyWith(bottom: 0),
      child: SingleChildScrollView(
        child: FutureBuilder(
          future: TransactionsDataRetrieve.getTransactionsList(),
          builder: (context, snapshot){
            if(!snapshot.hasError){
              print("Error ace odo");
            }
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            List<TransactionsViewModel> transactionViewModel = snapshot.data.transactionsViewModelList;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 25),
                  child: Text(
                    "Total Deposit: \$${snapshot.data.totalDeposit}",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                      letterSpacing: 2,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Container(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Divider()
                ),
                Container(
                  child: Text(
                    "All Deposits",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                        fontWeight: FontWeight.w400
                    ),
                  ),
                ),
                Container(
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: transactionViewModel.length,
                    itemBuilder: (context, index){
                      if(transactionViewModel[index].type.contains("deposit")){
                        return _buildItem(transactionViewModel[index]);
                      }
                      return Container();
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildItem(TransactionsViewModel transactionsViewModel){
    return ListTile(
      contentPadding: EdgeInsets.all(0),
      leading: CircleAvatar(
        backgroundColor: Color(0xFFFF7E7E),
        radius: 20,
        child: Icon(
          Icons.emoji_transportation_outlined,
          color: Colors.white,
        ),
      ),
      title: Text(
        transactionsViewModel.category.toUpperCase(),
        style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w400
        ),
      ),
      subtitle: Text(
        transactionsViewModel.account.toUpperCase(),
        style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w300
        ),
      ),
      trailing: Text(
        "Tk ${transactionsViewModel.transactions.amount}",
        style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w400
        ),
      ),
    );
  }
}
