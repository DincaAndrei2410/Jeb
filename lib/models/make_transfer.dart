class MakeTransferRequest {
  String? createdDate;
  String? date;
  int? beneficiaryId;
  double? sendAmount;
  double? receiveAmount;
  double? exchangeRate;

  Map<String, dynamic> toJson() => {
        'sendAmount': sendAmount,
        'receiveAmount': receiveAmount,
        'exchangeRate': exchangeRate,
        'beneficiaryId': beneficiaryId,
        'createdDate': createdDate,
        'date': date,
      };
}
