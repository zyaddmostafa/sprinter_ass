import 'package:easy_localization/easy_localization.dart';

class ValidationUtils {
  // Regex patterns
  static final RegExp emailRegex = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );
  static final RegExp passwordRegex = RegExp(r'^.{6,}$');
  static final RegExp nameRegex = RegExp(r'^[A-Z][a-zA-Z\s]*$');

  // Validation methods
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'validation.email_required'.tr();
    }
    if (!emailRegex.hasMatch(value)) {
      return 'validation.email_invalid'.tr();
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'validation.password_required'.tr();
    }
    if (!passwordRegex.hasMatch(value)) {
      return 'validation.password_min_length'.tr();
    }
    return null;
  }

  static String? validateConfirmPassword(
    String? password,
    String? confirmPassword,
  ) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return 'validation.confirm_password_required'.tr();
    }
    if (password != confirmPassword) {
      return 'validation.passwords_dont_match'.tr();
    }
    return null;
  }

  static String? validateFullName(String? value) {
    if (value == null || value.isEmpty) {
      return 'validation.full_name_required'.tr();
    }
    if (!nameRegex.hasMatch(value)) {
      return 'validation.full_name_format'.tr();
    }
    return null;
  }
}
