import 'package:intl/intl.dart';

class NumberFormatter {
  static String formatNumber(number) {
    final formatter = NumberFormat.decimalPatternDigits(
      locale: 'id_ID',
      decimalDigits: 2,
    );
    return formatter.format(number);
  }
}
