import 'package:flutter/material.dart';
import 'package:flutter_profile_app/example/drawer/widget/button_widget.dart';
import 'package:flutter_profile_app/example/drawer/widget/navigation_drawer_widget.dart';

class DrawerMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawerWidget(),
      // endDrawer: NavigationDrawerWidget(),
      appBar: AppBar(
        title: Text("Drawer Main"),
      ),
      body: Builder(
        builder: (context) => Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 32),
          child: ButtonWidget(
            icon: Icons.open_in_new,
            text: 'Open Drawer',
            onClicked: () {
              Scaffold.of(context).openDrawer();
              // Scaffold.of(context).openEndDrawer();
            },
          ),
        ),
      ),
    );
  }
}

