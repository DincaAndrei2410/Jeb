import 'dart:convert';

import 'package:jaib/consts.dart';
import 'package:jaib/models/beneficiary.dart';
import 'package:jaib/services/current_user_service.dart';

import 'send_money_details.dart';
import 'package:http/http.dart' as http;

class BeneficiaryService {
  static int? CurrentBeneficiaryId;

  static Future<bool> addBeneficiary() async {
    var url = "${WebApiBaseUrl}/MoneyTransfer/AddBeneficiary";

    var beneficiary = MoneyTransferBeneficiary();
    var currentTransferData = SendMoneyDetails.LocalSendMoneyDetails;

    beneficiary.accountNumber = currentTransferData.accountNumber;
    beneficiary.bankName = currentTransferData.bankName;
    beneficiary.purpose = currentTransferData.purpose;
    beneficiary.userId = CurrentUserService.currentUser?.id;
    beneficiary.lastName = currentTransferData.lastName;
    beneficiary.firstName = currentTransferData.firstName;

    var body = jsonEncode(<String, MoneyTransferBeneficiary>{
      'moneyTransferBeneficiary': beneficiary
    });
    var headers = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    };

    var response =
        await http.post(Uri.parse(url), body: body, headers: headers);

    if (response.statusCode == 200) {
      var body = json.decode(response.body);
      CurrentBeneficiaryId = body["id"];
      return true;
    } else {
      return false;
    }
  }
}
