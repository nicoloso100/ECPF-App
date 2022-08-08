import 'package:intl/intl.dart';

String dateToString(DateTime date) {
  var now = date.add(const Duration(hours: -5));
  final DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm');
  final String formatted = formatter.format(now);
  return formatted;
}
