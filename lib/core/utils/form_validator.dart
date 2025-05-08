import 'package:get/get_utils/get_utils.dart';

class FormValidator {
  static String? emailValidator(String? value) {
    if ((value == null || value.isEmpty)) {
      return "Please provide an email address".tr;
    }
    if (!value.isEmail) {
      return "Please provide a valid email address".tr;
    }
    return null;
  }

  static String? userNameValidator(String? value) {
    if ((value == null || value.isEmpty)) {
      return "Please provide a username".tr;
    }
    if (!value.isAlphabetOnly) {
      return "Please provide a valid username".tr;
    }
    return null;
  }

  static String? passwordValidator(String? value) {
    if ((value == null || value.isEmpty)) {
      return "Please provide a password".tr;
    }
    if (value.length < 8) {
      return "Password must be at least 8 chars long".tr;
    }
    return null;
  }

  static String? requiredValidator(String? value) {
    if ((value == null || value.isEmpty)) {
      return "This field is required".tr;
    }
    return null;
  }
}
