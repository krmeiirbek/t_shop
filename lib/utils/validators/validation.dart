class TValidator {
  static String? validateEmptyText(String? fieldName, String? value) {
    if (value == null || value.isEmpty) {
      return '$fieldName қажет.';
    }
    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Телефон нөмірі қажет.';
    }

    // Regular expression for phone number validation
    final phoneRegExp = RegExp(r'^7\d{9}$');

    if (!phoneRegExp.hasMatch(value)) {
      return 'Жарамсыз телефон нөмірінің форматы. +77xxxxxxxxx пайдаланыңыз';
    }

    return null;
  }
}
