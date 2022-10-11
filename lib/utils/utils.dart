import 'package:intl/intl.dart';

class Utils {
  static String dayOnly(String date) {
    String formattedDate =
        DateFormat('d MMM, yyyy').format(DateTime.parse(date));
    return formattedDate;
  }

  static String dateNew(DateTime now) {
    final DateFormat formatter = DateFormat('d MMM yyyy');
    final String formatted = formatter.format(now);

    return formatted;
  }

    static String getDateWithoutTime(String date) {
    String formattedDate =
        DateFormat('EEE d MMM, yyyy').format(DateTime.parse(date));
    return formattedDate;
  }

  static String readTimestamp(int timestamp) {
    var now = new DateTime.now();
    var format = new DateFormat('HH:mm a');
    var date = new DateTime.fromMicrosecondsSinceEpoch(timestamp * 1000);
    var diff = date.difference(now);
    var time = '';

    if (diff.inSeconds <= 0 ||
        diff.inSeconds > 0 && diff.inMinutes == 0 ||
        diff.inMinutes > 0 && diff.inHours == 0 ||
        diff.inHours > 0 && diff.inDays == 0) {
      time = format.format(date);
    } else {
      if (diff.inDays == 1) {
        time = diff.inDays.toString() + 'DAY AGO';
      } else {
        time = diff.inDays.toString() + 'DAYS AGO';
      }
    }

    return time;
  }
}
