import 'package:renting_bd/core/utils/constant.dart';

abstract class InputValidator {
  static String? validatePhoneNumber(String? s) {
    if (s == null) return Constant.invalidPhoneLabel;
    if (s.length > 16 || s.length < 9) return Constant.invalidPhoneLabel;

    final hasMatch = _hasMatch(s, r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$');
    if (hasMatch) return null;

    return Constant.invalidPhoneLabel;
  }

  static String? validatePassword(String? value) {
    if (value == null) return Constant.passwordRequiredLabel;
    if (value.length < 8) return Constant.passwordIncorrectLengthLabel;

    return null;
  }

  static String? validateEmail(String? email) {
    if (email != null && email.isNotEmpty) {
      final hasMatch = _hasMatch(email,
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

      if (!hasMatch) return Constant.invalidEmailLabel;
    }
    return null;
  }

  static String? validateUserName(String? name) {
    if (name != null && name.isNotEmpty) {
      final hasMatch = _hasMatch(name, r'^[a-zA-Z0-9][a-zA-Z0-9_.]+[a-zA-Z0-9]$');
      if (!hasMatch) return Constant.invalidUserNameLabel;
    }
    return null;
  }

  static String? emptyValidation(String? value, String title) {
    if (value?.trim().isNotEmpty == true) return null;
    return "$title ${Constant.isRequiredLabel}";
  }

  static bool _hasMatch(String? value, String pattern) {
    return (value == null) ? false : RegExp(pattern).hasMatch(value);
  }
}
