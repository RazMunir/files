import 'package:flutter/material.dart';
import 'package:flutter_profile_app/example/wm/utils/transactions_data_retrieve.dart';
import 'package:flutter_profile_app/example/wm/view_models/transactions_view_model.dart';

enum test {tt, pp}
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20).copyWith(bottom: 0, top: 0),
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 55.0,
                        width: 55.0,
                        child: CircularProgressIndicator(
                          value: 70 / 100,
                          strokeWidth: 4,
                          valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFFF7E7E)),
                          backgroundColor: Colors.grey[200],
                        ),
                      ),
                      SizedBox(
                        width: 25.0,
                      ),
                      Column(
                        children: [
                          Text(
                            "Deposit: \$${snapshot.data.totalDeposit}",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                              letterSpacing: 2,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            "Expanse: \$${snapshot.data.totalExpanse}",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                              letterSpacing: 2,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Divider()
                ),
                Container(
                  child: Text(
                    "All Expanses",
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
                      return _buildItem(transactionViewModel[index]);
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
