import 'package:flutter/material.dart';

class MDatePicker extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _MDatePicker();
  }
}

class _MDatePicker extends State<MDatePicker>{

  DateTime date = DateTime.now();

  @override
  Widget build(BuildContext context) {

    Future<void> _selectDate(BuildContext context) async {
          DateTime picked = await showDatePicker(
          context: context,
          initialDate: date,
          firstDate: DateTime(2015, 8),
          lastDate: DateTime(2101));
      if (picked != null && picked != date)
        setState(() {
          date = picked;
        });
    }

    return Center(
      child: InkWell(
        onTap: (){
          _selectDate(context);
        },
        child: Text("${date.toLocal()}".split(' ')[0]),
        // child: Text("$date"),
      ),
    );
  }

}