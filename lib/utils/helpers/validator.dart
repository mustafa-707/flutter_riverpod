import 'package:flutter_templete/utils/global_navigator.dart';
import 'package:flutter_templete/utils/lang/locale.export.dart';

class FieldValidator {
  static String? emailValidator(String? value) {
    final trimmedValue = value?.trim() ?? "";
    final translate = AppLocalizations.of(getRootNavigator().context);

    final isValidEmail = RegExp(
      r"^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}$",
      caseSensitive: false,
    ).hasMatch(trimmedValue);

    if (trimmedValue.isEmpty) {
      return translate?.pleaseEnterEmail;
    } else if (isValidEmail) {
      return null;
    }
    return translate?.correctEmail;
  }

  static String? passwordValidator(String? name) {
    final translate = AppLocalizations.of(getRootNavigator().context);
    if (name?.isEmpty ?? true) {
      return translate?.pleaseEnterPassword;
    }
    return null;
  }
}
