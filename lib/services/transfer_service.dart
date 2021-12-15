import 'dart:convert';

import 'package:jaib/consts.dart';
import 'package:jaib/models/transfer.dart';
import 'package:http/http.dart' as http;

class TransferService {
  static Future<List<Transfer>> getTransfer(String userId) async {
    var url = "${WebApiBaseUrl}MoneyTransfer/History/$userId";

    var response = await http.post(Uri.parse(url));

    if (response.statusCode == 200) {
      Iterable body = json.decode(response.body);
      var transfers = List<Transfer>.from(
          body.map((transferJson) => Transfer.fromJson(transferJson)));

      if (transfers.length > 0) {
        transfers.sort((a, b) => a.date.compareTo(b.date));
        var currentMonth = transfers[0].date.month;
        var currentYear = transfers[0].date.year;
        transfers[0].isFirstInMonth = true;

        for (var transfer in transfers) {
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
