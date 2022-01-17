import 'package:flutter/material.dart';
import 'package:flutter_profile_app/practice_v10/aspect_ratio_test.dart';
import 'package:flutter_profile_app/practice_v10/form_elements.dart';
import 'package:flutter_profile_app/practice_v10/routes.dart';
import 'package:flutter_profile_app/main.dart';

class DrawerTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: [
          ListView(
            children: [
              _createHeader(),
              _createDrawerItem(icon: Icons.event, text: 'Date Time', onTap: () =>
                  Navigator.pushReplacementNamed(context, DATE_TIME)),
              _createDrawerItem(icon: Icons.contacts, text: 'Aspect Ration', onTap: () =>
                  Navigator.of(context).pushReplacement(
                      new MaterialPageRoute(
                          settings: const RouteSettings(name: '/AspectRationTest'),
                          builder: (context) => new AspectRationTest(email: "drawer@gmail.com",)))
              ),
              _createDrawerItem(icon: Icons.event, text: 'Media Query', onTap: () =>
                  Navigator.pushReplacementNamed(context, MEDIA_QUERY)),
              _createDrawerItem(icon: Icons.event, text: 'Form Elements', onTap: () =>
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FormElementsTest()),
                  )
              ),
              Divider(),
              _createDrawerItem(icon: Icons.collections_bookmark, text: 'Steps'),
              _createDrawerItem(icon: Icons.face, text: 'Authors'),
            ],
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: ListTile(
              tileColor: Colors.black12,
              title: Text('0.0.1', textAlign: TextAlign.start,),

              onTap: () {},
            ),
          )
        ],
      ),
    );
  }

  Widget _createHeader() {
    // return DrawerHeader(
    //     margin: EdgeInsets.zero,
    //     padding: EdgeInsets.zero,
    //     decoration: BoxDecoration(
    //         image: DecorationImage(
    //             fit: BoxFit.fill,
    //             image: AssetImage('images/flutter_bird.png'))),
    //     child: Stack(children: <Widget>[
    //       Positioned(
    //           bottom: 12.0,
    //           left: 16.0,
    //           child: Text("Flutter Step-by-Step",
    //               style: TextStyle(
    //                   color: Colors.grey,
    //                   fontSize: 16.0,
    //                   fontWeight: FontWeight.w500))),
    //     ]));
    return  UserAccountsDrawerHeader(
      accountName: Text("Abhishek Mishra"),
      accountEmail: Text("abhishekm977@gmail.com"),
      currentAccountPicture: CircleAvatar(
        backgroundColor: Colors.orange,
        child: Text(
          "A",
          style: TextStyle(fontSize: 40.0),
        ),
      ),
    );
  }

  Widget _createDrawerItem({IconData icon, String text, GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text),
          )
        ],
      ),
      onTap: onTap,
    );
  }
}
