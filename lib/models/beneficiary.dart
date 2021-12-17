class Beneficiary {
  MoneyTransferBeneficiary? beneficiary;
}

class MoneyTransferBeneficiary {
  String? userId;
  String? countryCode;
  String? firstName;
  String? lastName;
  String? accountNumber;
  String? bankName;
  String? purpose;

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'countryCode': countryCode,
        'firstName': firstName,
        'lastName': lastName,
        'accountNumber': accountNumber,
        'bankName': bankName,
        'purpose': purpose,
      };
}
