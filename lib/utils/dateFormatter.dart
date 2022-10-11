import 'package:days/utils/utils.dart';

class DateFormatter {
  static const String _formatter = "EEE d MMM, yyyy";

  static DateTime get _yesterday => _today.subtract(const Duration(days: 1));

  static final DateTime _today = DateTime.now();

  static String get _formattedToday =>
      Utils.getDateWithoutTime(_today.toString());

  static String get _formattedYesterday =>
      Utils.getDateWithoutTime(_yesterday.toString());

  static String format(String date) {
    var notificationDate = Utils.getDateWithoutTime(date);
    var nowDate = Utils.dayOnly(date);
    if (notificationDate == _formattedToday) {
      return "Today";
    } else if (_formattedYesterday == notificationDate) {
      return "Yesterday, $nowDate";
    }
    return notificationDate;
  }
}
