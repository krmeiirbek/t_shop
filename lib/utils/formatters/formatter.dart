import 'package:intl/intl.dart';

class TFormatter {
  static String formatDate(DateTime? date) {
    date ??= DateTime.now();
    return DateFormat('dd.mm.yyyy').format(date);
  }

  static String formatCurrency(double amount) {
    return NumberFormat.currency(locale: 'kk_KZ', symbol: '\$').format(amount);
  }

  static String formatPhoneNumber(String phoneNumber) {
    if (phoneNumber.length == 10) {
      return '+7(${phoneNumber.substring(0, 3)}) ${phoneNumber.substring(3, 6)} ${phoneNumber.substring(6)}';
    }
    return phoneNumber;
  }
}
