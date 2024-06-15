import 'package:intl/intl.dart';

// Formatters
class TFormatter {

  /*
  Formats the date in the format dd-MMM-yyyy
  Examples
    formatDate(DateTime.now()) => 01-Jan-2022
    formatDate(DateTime(2022, 1, 1)) => 01-Jan-2022
   */
  static String formatDate(DateTime? date) {
    date ??= DateTime.now();
    return DateFormat('dd-MMM-yyyy').format(date);
  }

  /*
  Formats the currency in the format $1,000.00
  Examples
    formatCurrency(1000) => $1,000.00
    formatCurrency(1000.50) => $1,000.50
   */
  static String formatCurrency(double amount) {
    return NumberFormat.currency(locale: 'en_US', symbol: '\$').format(amount);
    // return NumberFormat.currency(locale: 'en_LK', symbol: 'LKR').format(amount);
  }

  /*
  Formats the phone number as (123) 456-7890 or 1 (123) 456-7890
  Examples
    formatPhoneNumber('1234567890') => (123) 456-7890
    formatPhoneNumber('12345678901') => 1 (123) 456-7890
   */
  static String formatPhoneNumber(String phoneNumber) {
    if (phoneNumber.length == 10) {
      return '(${phoneNumber.substring(0, 3)}) ${phoneNumber.substring(3, 6)}-${phoneNumber.substring(6, 10)}';
    }
    else if (phoneNumber.length == 11) {
      return '${phoneNumber.substring(0, 1)} (${phoneNumber.substring(1, 4)}) ${phoneNumber.substring(4, 7)}-${phoneNumber.substring(7, 11)}';
    }

    return phoneNumber;
  }

  /*
  Formats the international phone number as +1 (123) 456-7890 or +91 (123) 456-7890
  Examples
    formatInternationalPhoneNumber('1234567890') => +1 (123) 456-7890
    formatInternationalPhoneNumber('911234567890') => +91 (123) 456-7890
   */
  static String formatInternationalPhoneNumber(String phoneNumber) {
    // Remove all non-digit characters from the phone number
    var digitsOnlyPhoneNumber = phoneNumber.replaceAll(RegExp(r'\D'), '');

    // Extract the country code from the digitsOnlyPhoneNumber
    String countryCode = '+${digitsOnlyPhoneNumber.substring(0, 2)}';
    digitsOnlyPhoneNumber = digitsOnlyPhoneNumber.substring(2);

    // Add the remaining digits with proper formatting
    final formattedPhoneNumber = StringBuffer();
    formattedPhoneNumber.write('($countryCode) ');

    int i = 0;
    while (i < digitsOnlyPhoneNumber.length) {
      int groupLength = 2;
      if (i == 0 && countryCode == '+1') {
        groupLength = 3;
      }

      int end = i + groupLength;
      formattedPhoneNumber.write(digitsOnlyPhoneNumber.substring(i, end));

      if (end < digitsOnlyPhoneNumber.length) {
        formattedPhoneNumber.write('-');
      }
      i = end;
    }

    return formattedPhoneNumber.toString();
  }
}