class TValidator {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Электрондық пошта қажет.';
    }

    // Regular expression for email validation
    final emailRegExp = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegExp.hasMatch(value)) {
      return 'Электрондық пошта мекенжайы дұрыс емес.';
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Құпия сөз қажет.';
    }

    // Check for minimum password length
    if (value.length < 6) {
      return 'Құпия сөздің ұзындығы кемінде 6 таңба болуы керек.';
    }

    // Check for uppercase letters
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Құпия сөзде кем дегенде бір бас әріп болуы керек.';
    }

    // Check for numbers
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Құпия сөзде кем дегенде бір сан болуы керек.';
    }

    // Check for special characters
    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'Құпия сөзде кем дегенде бір арнайы таңба болуы керек.';
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
      return 'Жарамсыз телефон нөмірінің форматы. +7 xxx xxx xxxx пайдаланыңыз';
    }

    return null;
  }

// Add more custom validators as needed for your specific requirements.
}
