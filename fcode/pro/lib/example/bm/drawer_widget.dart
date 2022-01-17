import 'package:flutter/material.dart';
import 'package:flutter_profile_app/example/bm/bm_info_page.dart';
import 'package:flutter_profile_app/example/bm/bm_main.dart';

class DrawerWidget extends StatelessWidget {
  final int currentPage;

  const DrawerWidget({Key key, this.currentPage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        child: ListView(
          children: [
            _buildHeader(),
            _buildDrawerItem(
              text: "Home",
              icon: Icons.home_outlined,
              onClicked: () => selectedItem(context, 0)
            ),
            _buildDrawerItem(
              text: "Info",
              icon: Icons.info_outlined,
              onClicked: () => selectedItem(context, 1)
            )
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(){
    return UserAccountsDrawerHeader(
      accountName: Text("Abhishek Mishra"),
      accountEmail: Text("abhishekm977@gmail.com"),
      currentAccountPicture: CircleAvatar(
        backgroundColor: Colors.orange,
        child: Text(
          "A",
          style: TextStyle(fontSize: 40.0),
        ),
      ),
      decoration: BoxDecoration(
        color: Color.fromRGBO(50, 75, 205, 1),
      ),
    );
  }

  Widget _buildDrawerItem({String text, IconData icon, Function onClicked}){
    return ListTile(
      leading: Icon(icon,),
      title: Text(
        text,
        style: TextStyle(),
      ),
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index){
    Navigator.of(context).pop();

    if(index == currentPage) return;

    switch(index){
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => BMMain(),
        ));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => BMInfoPage(),
        ));
        break;
      default:
        break;
    }
  }
}
