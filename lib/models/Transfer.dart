import 'dart:ffi';

class Transfer {
  String senderName;
  double amount;
  DateTime date;
  bool isFirstInMonth;

  Transfer(this.senderName, this.amount, this.date, this.isFirstInMonth);
}
