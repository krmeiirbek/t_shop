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
    final phoneRegExp = RegExp(r'^\d{10}$');

    if (!phoneRegExp.hasMatch(value)) {
      return 'Телефон нөмірінің форматы дұрыс емес. Осындай форматта +71234567890 пайдаланыңыз';
    }

    return null;
  }
}
