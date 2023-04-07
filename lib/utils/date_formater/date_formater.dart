import 'package:intl/intl.dart';

DateTime dateFormatter(String givenDate){
  DateTime date = DateTime.parse(givenDate);
  return date;
}

String getDateFromDateTime(DateTime dateTime, {String? format}) {
  final DateFormat formatter = DateFormat(format ?? 'dd-MM-yyyy');
  final String formatted = formatter.format(dateTime);
  return formatted;
}