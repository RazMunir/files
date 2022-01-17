class FieldValidator {
  static String validateField({String value}) {
    if (value.isEmpty) {
      return 'Field can\'t be empty';
    }
    return null;
  }

  static String validateDDField({String value}) {
    if (value == null) {
      return 'Please select a option from drop down';
    }
    return null;
  }

  static String validateUserID({String uid}) {
    if (uid.isEmpty) {
      return 'User ID can\'t be empty';
    } else if (uid.length <= 3) {
      return 'User ID should be greater than 3 characters';
    }

    return null;
  }
}