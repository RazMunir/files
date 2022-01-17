import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class FormElementsTest extends StatefulWidget {
  @override
  _FormElementsTestState createState() => _FormElementsTestState();
}

enum TransactionType { credit, debit }

class _FormElementsTestState extends State<FormElementsTest> {
  // for radio button
  TransactionType _transactionType = TransactionType.debit;
  // for date picker
  DateTime selectedDate = DateTime.now();
  // for dropdown
  final List<String> _priorities = ['Low', 'Medium', 'High'];
  String _priority;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _priority = _priorities[1];
  }

  void _presentDatePicker(BuildContext context) {
    showDatePicker(
      helpText: 'Transaction Date',
      confirmText: 'YES!',
      cancelText: 'NO!',
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now().subtract(
        Duration(days: 7),
      ),
      // lastDate: DateTime.now(), // only selecting for 7 days
      lastDate: DateTime(2022),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0D2F4B),
      appBar: AppBar(
        title: Text("Form Elements"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            //radio button
            Theme(
              data: ThemeData(
                  unselectedWidgetColor: Colors.white
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(children: [
                    Radio(
                      value: TransactionType.debit,
                      groupValue: _transactionType,
                      activeColor: Color(0xFFFF2E63),

                      onChanged: (TransactionType value) {
                        setState(() {
                          _transactionType = value;
                        });
                      },
                    ),
                    Text(
                      'Debit',
                      style: GoogleFonts.nunito(
                        color: Colors.white70,
                        fontSize: 22.0,
                      ),
                    ),
                  ]),
                  Row(children: [
                    Radio(
                      value: TransactionType.credit,
                      groupValue: _transactionType,
                      activeColor: Color(0xFFFF2E63),
                      onChanged: (TransactionType value) {
                        setState(() {
                          _transactionType = value;
                        });
                      },
                    ),
                    Text(
                      'Credit',
                      style: GoogleFonts.nunito(
                        color: Colors.white70,
                        fontSize: 22.0,
                      ),
                    ),
                  ]),
                ],
              ),
            ),
            //end radio button

            //date picker
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  selectedDate == null
                      ? 'No Date chosen'
                      : DateFormat.yMMMEd()
                      .format(selectedDate),
                  style: GoogleFonts.poppins(
                    fontSize: 15.0,
                    letterSpacing: 1,
                    color: Colors.white,
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    _presentDatePicker(context);
                  },
                  child: Text(
                    'Change Date',
                    style: GoogleFonts.poppins(
                      fontSize: 18.0,
                      letterSpacing: 1,
                      color: Color(0xFFFF2E63),
                    ),
                  ),
                ),
              ],
            ),
            //end date picker

            // dropdown
            DropdownButtonFormField(
              icon: Icon(
                Icons.keyboard_arrow_down,
              ),
              iconEnabledColor: Colors.cyanAccent,
              iconSize: 22.0,
              value: _priority,
              isDense: true,
              items: _priorities.map((String priority) {
                return DropdownMenuItem(
                  value: priority,
                  child: Text(
                    priority,
                    style: TextStyle(
                      color: Colors.cyanAccent,
                      fontSize: 18.0,
                    ),
                  ),
                );
              }).toList(),
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.white
              ),
              decoration: InputDecoration(
                labelText: 'Priority',
                labelStyle: TextStyle(
                  fontSize: 18.0,
                  color: Colors.cyanAccent,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    10.0,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                        color: Colors.cyanAccent, width: 2.0
                    )
                )
              ),
              validator: (input) => _priority == null
                  ? 'Please select a Priority Level'
                  : null,
              onChanged: (value) {
                setState(() {
                  _priority = value;
                });
              },
            ),
            //end dropdown

            // chackbox
            ListTile(
              leading: Checkbox(
                checkColor: Colors.white,
                onChanged: (value) {},
                activeColor: Theme.of(context).primaryColor,
                value: true,
              ),
            ),
            Theme(
              data: ThemeData(
                unselectedWidgetColor: Colors.orangeAccent,
              ),
              child: ListTile(
                leading: Checkbox(
                  checkColor: Colors.white,
                  onChanged: (value) {},
                  activeColor: Theme.of(context).primaryColor,
                  value: false,
                ),
              ),
            ),
            ListTile(
              subtitle: Text("It is subtitle",style: TextStyle(color: Colors.white),),
              title: Text("Title",style: TextStyle(color: Colors.white),),
              leading: GestureDetector(
                onTap: () {
                },
                child: Container(
                  height: 21.0,
                  width: 21.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  decoration: BoxDecoration(
                    color: 1 == 0 ? Colors.white : Colors.redAccent,
                    border: Border.all(
                      width: 1.0,
                      color: Colors.black26,
                      style: BorderStyle.solid,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Center(
                    child: 1 == 0
                        ? SizedBox.shrink()
                        : Icon(
                      Icons.check,
                      size: 17.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              trailing: Icon(
                Icons.edit,
                size: 20.0,
                color: Colors.red,
              ),
            ),
            ListTile(
              subtitle: Text("It is subtitle",style: TextStyle(color: Colors.white),),
              title: Text("Title",style: TextStyle(color: Colors.white),),
              leading: GestureDetector(
                onTap: () {
                },
                child: Container(
                  height: 21.0,
                  width: 21.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  decoration: BoxDecoration(
                    color: 0 == 0 ? Colors.white : Colors.redAccent,
                    border: Border.all(
                      width: 1.0,
                      color: Colors.black26,
                      style: BorderStyle.solid,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Center(
                    child: 0 == 0
                        ? SizedBox.shrink()
                        : Icon(
                      Icons.check,
                      size: 17.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              trailing: Icon(
                Icons.edit,
                size: 20.0,
                color: Colors.red,
              ),
            )
            // end chackbox
          ],
        ),
      ),
    );
  }
}
