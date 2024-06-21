import 'package:renting_bd/core/utils/constant.dart';

abstract class InputValidator {
  static String? validatePhoneNumber(String? s) {
    if (s == null) return Constant.invalidPhone;
    if (s.length > 16 || s.length < 9) return Constant.invalidPhone;

    final hasMatch = _hasMatch(s, r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$');
    if (hasMatch) return null;

    return Constant.invalidPhone;
  }

  static String? validatePassword(String? value) {
    if (value == null) return Constant.passwordRequired;
    if (value.length < 8) return Constant.passwordIncorrectLength;

    return null;
  }

  static String? validateEmail(String? email) {
    if (email != null && email.isNotEmpty) {
      final hasMatch = _hasMatch(email,
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

      if (!hasMatch) return Constant.invalidEmail;
    }
    return null;
  }

  static String? validateUserName(String? name) {
    if (name != null && name.isNotEmpty) {
      final hasMatch = _hasMatch(name, r'^[a-zA-Z0-9][a-zA-Z0-9_.]+[a-zA-Z0-9]$');
      if (!hasMatch) return Constant.invalidUserName;
    }
    return null;
  }

  static String? emptyValidation(String? value, String title) {
    if (value?.trim().isNotEmpty == true) return null;
    return "$title ${Constant.isRequired}";
  }

  static bool _hasMatch(String? value, String pattern) {
    return (value == null) ? false : RegExp(pattern).hasMatch(value);
  }
}
