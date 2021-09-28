import 'package:intl/intl.dart';

class Converter{
  String dateToString(DateTime date) {
    final DateFormat formatter = DateFormat('dd-MM-yyyy');
    final res = formatter.format(date);
    return res;
  }

  String date14Before(DateTime now){
    final before = now.subtract(Duration(days: 14));
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final res = formatter.format(before);
    return res;
  }

  String date14After(DateTime now){
    final before = now.add(Duration(days: 14));
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final res = formatter.format(before);
    return res;
  }
}