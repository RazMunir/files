import 'package:flutter/material.dart';
import 'package:flutter_app_wallet_management/res/colors.dart';
import 'package:flutter_app_wallet_management/res/dimensions.dart';

class CustomFormDDFieldWidget extends StatelessWidget {
  final String label;
  final String hint;
  final String value;
  final List<String> valueList;
  final Function(String) validator;
  final Function(String) onChanged;
  final bool isLabelEnabled;

  const CustomFormDDFieldWidget(
      {Key key,
        @required this.label,
        @required this.hint,
        this.value,
        @required this.valueList,
        @required this.validator,
        @required this.onChanged,
        this.isLabelEnabled = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      icon: Icon(
        Icons.keyboard_arrow_down,
      ),
      iconEnabledColor: colorSelectionAccordingToTheme(),
      iconSize: 22.0,
      value: this.value,
      isDense: true,
      items: this.valueList.map((String priority) {
        return DropdownMenuItem(
          value: priority,
          child: Text(
            priority,
            style: TextStyle(
              color: colorSelectionAccordingToTheme(),
            ),
          ),
        );
      }).toList(),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(kDefaultPadding * 0.50).copyWith(left: 25),
        labelText: (this.isLabelEnabled) ? this.label : null,
        labelStyle: TextStyle(
          color: colorSelectionAccordingToTheme(),
        ),
        hintText: this.hint,
        hintStyle: TextStyle(
            color: colorSelectionAccordingToTheme().withOpacity(0.5)
        ),
        errorStyle: TextStyle(
          color: Colors.redAccent,
          fontWeight: FontWeight.bold,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(35.0),
          borderSide: BorderSide(
            color: colorSelectionAccordingToTheme(),
            width: 2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(35.0),
          borderSide: BorderSide(
              color: colorSelectionAccordingToTheme().withOpacity(0.5)
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(35.0),
          borderSide: BorderSide(
            color: Colors.redAccent,
            width: 2,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(35.0),
          borderSide: BorderSide(
            color: Colors.redAccent,
            width: 2,
          ),
        ),
      ),
      validator: this.validator,
      onChanged: this.onChanged,
    );
  }
}