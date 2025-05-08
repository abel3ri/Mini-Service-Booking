import 'package:get/get_utils/get_utils.dart';

class FormValidator {
  static String? emailValidator(String? value) {
    if ((value == null || value.isEmpty)) {
      return "text_Please_provide_an_email_address".tr;
    }
    if (!value.isEmail) {
      return "text_Please_provide_a_valid_email_address".tr;
    }
    return null;
  }

  static String? userNameValidator(String? value) {
    if ((value == null || value.isEmpty)) {
      return "text_Please_provide_a_username".tr;
    }
    if (!value.isAlphabetOnly) {
      return "text_Please_provide_a_valid_username".tr;
    }
    return null;
  }

  static String? passwordValidator(String? value) {
    if ((value == null || value.isEmpty)) {
      return "text_Please_provide_a_password".tr;
    }
    if (value.length < 8) {
      return "text_Password_must_be_at_least_8_chars_long".tr;
    }
    return null;
  }

  static String? requiredValidator(String? value) {
    if ((value == null || value.isEmpty)) {
      return "text_This_field_is_required".tr;
    }
    return null;
  }
}
