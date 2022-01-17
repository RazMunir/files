import 'package:flutter/material.dart';
import 'package:flutter_profile_app/example/wm/screens/deposit_screen.dart';
import 'package:flutter_profile_app/example/wm/screens/expanse_screen.dart';
import 'package:flutter_profile_app/example/wm/screens/home_screen.dart';

class WMMain extends StatefulWidget {
  @override
  _WMMainState createState() => _WMMainState();
}

class _WMMainState extends State<WMMain> {
  int currentPageIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildPages(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPageIndex,
        backgroundColor: Color(0xFFFF7E7E),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        items: [
          BottomNavigationBarItem(
            icon: Image.network(
              "https://raw.githubusercontent.com/afzalali15/Flutter-Rounded-Design/master/assets/home_icon.png",
              color: Colors.white,
            ),
            label: "Home"
          ),
          BottomNavigationBarItem(
            icon: Image.network(
              "https://raw.githubusercontent.com/afzalali15/Flutter-Rounded-Design/master/assets/search_icon.png",
              color: Colors.white,
            ),
            label: "Expanse"
          ),
          BottomNavigationBarItem(
            icon: Image.network(
              "https://raw.githubusercontent.com/afzalali15/Flutter-Rounded-Design/master/assets/profile_icon.png",
              color: Colors.white,
            ),
            label: "Deposit"
          )
        ],
        onTap: (index){
          currentPageIndex = index;
          setState(() {});
        },
      ),
    );
  }

  Widget buildPages(){
    switch (currentPageIndex) {
      case 0:
        return HomeScreen();
      case 1:
        return ExpanseScreen();
      default:
        return DepositScreen();
    }
  }
}