import 'dart:ffi';

class Transfer {
  String senderName;
  double amount;
  DateTime date;
  bool isFirstInMonth;

  static var Transfers = [
    Transfer("Anis Zarrad", 400.0, DateTime(2021, 9, 29), true),
    Transfer("Mariam Saadi", 9900.0, DateTime(2021, 9, 30), false),
    Transfer("Abdul Samad", 257.0, DateTime(2021, 10, 31), true)
  ];

  Transfer(this.senderName, this.amount, this.date, this.isFirstInMonth);
}
