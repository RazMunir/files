import 'package:flutter/material.dart';
import 'package:flutter_profile_app/example/bm/drawer_widget.dart';

class BMInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(currentPage: 1,),
      body: Container(
        child: Center(
          child: Text("Info Page"),
        ),
      ),
    );
  }
}
