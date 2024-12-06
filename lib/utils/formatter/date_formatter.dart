import 'package:intl/intl.dart';

class DateFormatter {
  static String getDate(DateTime date) {
    final DateFormat formatter = DateFormat('EEEE dd.MM.yyyy');
    return formatter.format(date);
  }

  static String getDayName(DateTime date) {
    final DateFormat formatter = DateFormat('EEEE');
    return formatter.format(date);
  }

  static String getShortDate(DateTime date) {
    final DateFormat formatter = DateFormat('dd.MM.yyyy');
    return formatter.format(date);
  }

  static String getShortTime(DateTime dateTime) {
    final DateFormat formatter = DateFormat('HH.mm.ss');
    return formatter.format(dateTime);
  }

  static String getTime(DateTime dateTime) {
    final DateFormat formatter = DateFormat('HH.mm.ss');
    return formatter.format(dateTime);
  }

  static String getLongDateFromString(String string) {
    final date = DateTime.parse(string);

    return '${getDate(date)} - ${getShortTime(date)}';
  }

  static String getLongDate(DateTime date) {
    final DateFormat formatter = DateFormat('dd MMM yyyy HH:mm');

    return formatter.format(date);
  }

  static String getMonthName(int month) {
    final DateFormat formatter = DateFormat('MMMM');

    return formatter.format(DateTime(0, month));
  }
}
