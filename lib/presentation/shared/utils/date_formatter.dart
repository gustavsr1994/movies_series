import 'package:intl/intl.dart';

class DateFormatter {
  DateTime get now => DateTime.now();

  static toDDMMMYYYY(String input) {
    var dateFormat = DateFormat('yyyy-MM-dd');
    var date = dateFormat.parse(input);
    var output = DateFormat('dd MMM yyyy');
    return output.format(date);
  }

  static fromDateToStringDDMMMYYY(DateTime date) {
    var dateFormat = DateFormat('yyyy-MM-dd HH:mm:ss');
    var output = dateFormat.format(date);
    return output;
  }
}