import 'dart:convert';

import 'package:jaib/consts.dart';
import 'package:jaib/models/make_transfer.dart';
import 'package:jaib/models/transfer.dart';
import 'package:http/http.dart' as http;
import 'package:jaib/services/send_money_details.dart';

import 'beneficiary_service.dart';

class TransferService {
  static Future<bool> makeTransfer() async {
    var url = "${WebApiBaseUrl}/MoneyTransfer/MakeTransfer";

    var makeTransferRequest = MakeTransferRequest();
    var currentTransferData = SendMoneyDetails.LocalSendMoneyDetails;

    makeTransferRequest.sendAmount = currentTransferData.sendAmount;
    makeTransferRequest.receiveAmount = currentTransferData.receiveAmount;
    makeTransferRequest.exchangeRate = currentTransferData.exchangeRate;
    makeTransferRequest.beneficiaryId = BeneficiaryService.CurrentBeneficiaryId;
    makeTransferRequest.createdDate = DateTime.now().toIso8601String();
    makeTransferRequest.date = DateTime.now().toIso8601String();

    var body = jsonEncode(<String, dynamic>{'transfer': makeTransferRequest});
    var headers = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    };

    var response =
        await http.post(Uri.parse(url), body: body, headers: headers);

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future<List<Transfer>> getTransfer(String userId) async {
    var url = "${WebApiBaseUrl}MoneyTransfer/History/$userId";

    var response = await http.post(Uri.parse(url));

    if (response.statusCode == 200) {
      Iterable body = json.decode(response.body);

      var transfers = List<Transfer>.from(
          body.map((transferJson) => Transfer.fromJson(transferJson)));

      if (transfers.length > 0) {
        transfers.sort((a, b) => b.date.compareTo(a.date));
        transfers = transfers.take(3).toList();
        var currentMonth = transfers[0].date.month;
        var currentYear = transfers[0].date.year;
        transfers[0].isFirstInMonth = true;

        for (var transfer in transfers) {
          var name = await BeneficiaryService.getBeneficiaryName(
              transfer.beneficiaryId);

          transfer.setBeneficiaryName(name);

          if (transfer.date.month != currentMonth &&
              transfer.date.year != currentYear) {
            transfer.isFirstInMonth = true;
            currentMonth = transfer.date.month;
            currentYear = transfer.date.year;
          }
        }
      }

      return transfers;
    } else {
      throw Exception('Backend error');
    }
  }
}
