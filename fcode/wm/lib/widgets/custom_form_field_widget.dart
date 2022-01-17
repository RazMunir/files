import 'package:flutter/material.dart';
import 'package:flutter_app_wallet_management/res/colors.dart';
import 'package:flutter_app_wallet_management/res/dimensions.dart';

Color firebaseYellow = Color(0xFFFFCA28);

class CustomFormFieldWidget extends StatelessWidget {
  const CustomFormFieldWidget({
    Key key,
    @required TextEditingController controller,
    @required FocusNode focusNode,
    @required TextInputType keyboardType,
    @required TextInputAction inputAction,
    @required String label,
    @required String hint,
    @required Function(String value) validator,
    this.onChange = null,
    this.isObscure = false,
    this.isCapitalized = false,
    this.maxLines = 1,
    this.isLabelEnabled = true,
    this.contentPaddingPercentage = 0.50,
  })  : _emailController = controller,
        _emailFocusNode = focusNode,
        _keyboardtype = keyboardType,
        _inputAction = inputAction,
        _label = label,
        _hint = hint,
        _validator = validator,
        super(key: key);

  final TextEditingController _emailController;
  final FocusNode _emailFocusNode;
  final TextInputType _keyboardtype;
  final TextInputAction _inputAction;
  final String _label;
  final String _hint;
  final bool isObscure;
  final bool isCapitalized;
  final int maxLines;
  final bool isLabelEnabled;
  final Function(String) _validator;
  final Function(String) onChange;
  final double contentPaddingPercentage;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      controller: _emailController,
      focusNode: _emailFocusNode,
      keyboardType: _keyboardtype,
      obscureText: isObscure,
      textCapitalization: isCapitalized ? TextCapitalization.words : TextCapitalization.none,
      textInputAction: _inputAction,
      cursorColor: colorSelectionAccordingToTheme(),
      validator: (value) => _validator(value),
      onChanged: onChange,
      decoration: InputDecoration(
        // contentPadding: EdgeInsets.only(left: 30),
        contentPadding: EdgeInsets.all(kDefaultPadding * this.contentPaddingPercentage).copyWith(left: 25),
        labelText: isLabelEnabled ? _label : null,
        labelStyle: TextStyle(color: colorSelectionAccordingToTheme()),
        hintText: _hint,
        hintStyle: TextStyle(
          // color: selectedTheme == 1 ? kContentColorLightTheme.withOpacity(0.5) : kContentColorDarkTheme.withOpacity(0.5),
            color: colorSelectionAccordingToTheme().withOpacity(0.5)
        ),
        errorStyle: TextStyle(
          color: Colors.redAccent,
          fontWeight: FontWeight.bold,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(35.0),
          borderSide: BorderSide(
            // color: firebaseAmber,
            // color: selectedTheme == 1 ? kContentColorLightTheme : kContentColorDarkTheme,
            color: colorSelectionAccordingToTheme(),
            width: 2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(35.0),
          borderSide: BorderSide(
            // color: firebaseGrey.withOpacity(0.5),
            // color: selectedTheme == 1 ? kContentColorLightTheme.withOpacity(0.5) : kContentColorDarkTheme.withOpacity(0.5),
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
    );
  }
}