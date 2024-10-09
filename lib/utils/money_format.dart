import 'package:intl/intl.dart';

class MoneyFormat {
  static String format(int price){
    final formatData = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0);
    return formatData.format(price);
  }
}