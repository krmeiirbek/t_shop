import 'package:get/get.dart';
import 'package:t_store/localization/tr_constants.dart';

class TValidator {
  static String? validateEmptyText(String? fieldName, String? value) {
    if (value == null || value.isEmpty) {
      return '$fieldName ${needText.tr}.';
    }
    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return needPhoneNumber.tr;
    }

    final phoneRegExp = RegExp(r'^7\d{9}$');

    if (!phoneRegExp.hasMatch(value)) {
      return errorFormatPhoneNumber.tr;
    }

    return null;
  }
}
