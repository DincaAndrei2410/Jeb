import 'dart:ffi';

class Beneficiary {
  String name;

  Beneficiary(this.name);

  factory Beneficiary.fromJson(Map<String, dynamic> json) {
    return Beneficiary(json["firstName"] + " " + json["lastName"]);
  }
}

class Transfer {
  Beneficiary beneficiary;
  double receiveAmount;
  DateTime date;
  bool? isFirstInMonth;

  Transfer(this.beneficiary, this.receiveAmount, this.date,
      {this.isFirstInMonth});

  factory Transfer.fromJson(Map<String, dynamic> json) {
    return Transfer(Beneficiary.fromJson(json["beneficiary"]),
        json["receiveAmount"], json["date"]);
  }
}
