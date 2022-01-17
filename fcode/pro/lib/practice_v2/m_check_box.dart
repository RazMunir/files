import 'package:flutter/material.dart';
import 'package:flutter_profile_app/practice_v2/m_check_box_custom.dart';

class MCheckBox extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _MCheckBox();
  }
}

class _MCheckBox extends State<MCheckBox>{
  var _isCheck = false;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Theme(
            data: Theme.of(context).copyWith(
              unselectedWidgetColor: Colors.redAccent
            ),
            child: Transform.scale(
              scale: 2,
              child: Checkbox(
                value: _isCheck,
                checkColor: Colors.yellowAccent,
                activeColor: Colors.grey,
                onChanged: (value){
                  setState(() {
                    _isCheck = value;
                  });
                },
              ),
            ),
          ),
          AppCheckbox(
            size: 20,
            value: false,
            onChanged: (bool value){
              print(value);
            },
            disabled: false,
          )
        ],
      ),
    );
  }
}