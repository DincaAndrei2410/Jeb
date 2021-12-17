import 'dart:ffi';

class Beneficiary {
  String name;

  Beneficiary(this.name);

  factory Beneficiary.fromJson(Map<String, dynamic> json) {
    return Beneficiary(json["firstName"] + " " + json["lastName"]);
  }
}

class Transfer {
  int beneficiaryId;
  Beneficiary beneficiary;
  double receiveAmount;
  DateTime date;
  bool? isFirstInMonth;

  Transfer(this.beneficiary, this.receiveAmount, this.date, this.beneficiaryId,
      {this.isFirstInMonth});

  factory Transfer.fromJson(Map<String, dynamic> json) {
    return Transfer(Beneficiary(""), json["receiveAmount"],
        DateTime.parse(json["date"]), json["beneficiaryId"]);
  }

  setBeneficiaryName(String beneficiaryName) {
    beneficiary.name = beneficiaryName;
  }
}
