import 'package:intl/intl.dart';

class NumberFormatter {
  static String formatNumber(number) {
    final formatter = NumberFormat.decimalPattern('id_ID');
    return formatter.format(number);
  }
}
