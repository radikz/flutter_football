import 'package:intl/intl.dart';

class Converter{
  String dateToString(DateTime date) {
    final DateFormat formatter = DateFormat('dd-MM-yyyy');
    final res = formatter.format(date);
    return res;
  }
}