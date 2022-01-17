import 'package:flutter/material.dart';
import 'package:flutter_profile_app/screens/login_system/forget_password.dart';

class MPhysicalModel extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _MPhysicalModel();
  }
}

class _MPhysicalModel extends State<MPhysicalModel>{
  @override
  Widget build(BuildContext context) {
    return Center(
    child: PhysicalModel(
      color: Colors.black,
      shadowColor: Colors.pink,
      elevation: 8.0,
      shape: BoxShape.circle,
      borderRadius: BorderRadius.all
        (Radius.circular(10)),
      child: SizedBox(
        width: 100,
        height: 100,
        child: Container(
          color: Colors.blue.withOpacity(0.5),
        ),
      ),
    ),
    );
  }
}