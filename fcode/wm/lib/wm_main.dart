import 'package:flutter/material.dart';
import 'package:flutter_app_wallet_management/controllers/transaction_controller.dart';
import 'package:flutter_app_wallet_management/pages/transaction_add/transection_add.dart';
import 'package:flutter_app_wallet_management/res/colors.dart';
import 'package:flutter_app_wallet_management/res/strings.dart';
import 'package:flutter_app_wallet_management/screens/deposit_screen.dart';
import 'package:flutter_app_wallet_management/screens/expanse_screen.dart';
import 'package:flutter_app_wallet_management/screens/home_screen.dart';
import 'package:flutter_app_wallet_management/widgets/nav_drawer_widget.dart';

class WMMain extends StatefulWidget {
  @override
  _WMMainState createState() => _WMMainState();
}

class _WMMainState extends State<WMMain> {
  int currentPageIndex = 0;
  TransactionController controller = TransactionController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawerWidget(controller: controller),
      appBar: buildAppBar(),
      body: FutureBuilder(
        future: controller.getAllDataForWmMain(),
        builder: (context, snapshot){
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return SafeArea(
            child: buildPages(),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPageIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: homeString
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.money),
            label: expenseString
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money_outlined),
            label: depositString
          )
        ],
        onTap: (index){
          currentPageIndex = index;
          setState(() {});
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TransactionAdd(),
            ),
          );
        },
        child: Icon(
          Icons.add,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
        ),
        backgroundColor: kPrimaryColor,
      ),
    );
  }

  Widget buildPages(){
    switch (currentPageIndex) {
      case 0:
        return HomeScreen(controller: controller,);
      case 1:
        return ExpanseScreen(controller: controller,);
      default:
        return DepositScreen(controller: controller,);
    }
  }

  buildAppBar(){
    return AppBar(
      leading: Container(),
      actions: [
        IconButton(
          icon: Icon(
            Icons.refresh_outlined,
          ),
          onPressed: (){
            setState(() {});
          },
        ),
        Builder(
          builder: (context) {
            return IconButton(
              icon: Icon(
                Icons.menu_outlined,
              ),
              onPressed: (){
                Scaffold.of(context).openDrawer();
              },
            );
          }
        )
      ],
    );
  }
}