import 'package:flutter/material.dart';

class FormValidation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FormValidation();
  }
}

class _FormValidation extends State<FormValidation> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildBody(),
    );
  }

  Widget buildAppBar() {
    return AppBar(
      title: Text("Form Validation"),
    );
  }

  Widget buildBody() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: _formKey,
        // autovalidateMode: AutovalidateMode.always,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Form-Validation In Flutter ",
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            //styling
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.1,
            ),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter some text";
                }
                return null;
              },
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'E-Mail'),
              keyboardType: TextInputType.emailAddress,
              onFieldSubmitted: (value) {
                //Validator
              },
              validator: (value) {
                if (value.isEmpty ||
                    !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value)) {
                  return 'Enter a valid email!';
                }
                return null;
              },
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Name'),
              keyboardType: TextInputType.emailAddress,
              onFieldSubmitted: (value) {
                //Validator
              },
              validator: (value) {
                if (value.isEmpty ||
                    !RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$")
                        .hasMatch(value)) {
                  return 'Please enter a valid name';
                }
                return null;
              },
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Name'),
              keyboardType: TextInputType.emailAddress,
              onFieldSubmitted: (value) {
                //Validator
              },
              validator: (value) {
                if (value.isEmpty ||
                    !RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                        .hasMatch(value)) {
                  return 'Password must contain an uppercase, lowercase, numeric digit and special character';
                }
                return null;
              },
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              validator: validatePassword,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  hintText: 'Enter secure password'),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Phone Number'),
              keyboardType: TextInputType.emailAddress,
              onFieldSubmitted: (value) {
                //Validator
              },
              validator: (value) {
                if (value.isEmpty ||
                    !RegExp(r"^\+?0[0-9]{10}$")
                        .hasMatch(value)) {
                  return 'Phone Number must be up to 11 digits';
                }
                return null;
              },
            ),
            ElevatedButton(
              onPressed: () {
                if(_formKey.currentState.validate()){
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text('Processing Data')));
                }
              },
              child: Text("Submit"),
            )
          ],
        ),
      ),
    );
  }

  String validatePassword(String value) {
    if (value.isEmpty) {
      return "* Required";
    } else if (value.length < 6) {
      return "Password should be atleast 6 characters";
    } else if (value.length > 15) {
      return "Password should not be greater than 15 characters";
    } else
      return null;
  }
}
