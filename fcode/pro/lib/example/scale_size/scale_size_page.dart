import 'package:flutter/material.dart';
import 'package:flutter_profile_app/example/scale_size/size_config.dart';

class ScaleSizePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _ScaleSizePage();
  }
}

class _ScaleSizePage extends State<ScaleSizePage>{
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              height: SizeConfig.safeBlockVertical * 25,
              width: SizeConfig.safeBlockHorizontal * 55,
              color: Colors.black,
            ),
            Text(
              'Scaling text!',
              style: TextStyle(
                fontSize: SizeConfig.safeBlockHorizontal * 10,
              ),
            )
          ],
        ),
      ),
    );
  }
}