import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jaib/models/user.dart';
import 'package:jaib/services/signup_data_service.dart';
import '../consts.dart';

class SignupService {
  static Future<int> validateCard(String cardNumber) async {
    var url = "${WebApiBaseUrl}/SignUp/ValidateCard";
    var body =
        jsonEncode(<String, String>{'cardNumber': cardNumber.toString()});
    var headers = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    };

    var response =
        await http.post(Uri.parse(url), body: body, headers: headers);

    if (response.statusCode == 200) {
      var body = json.decode(response.body);
      return body;
    } else {
      return -1;
    }
  }

  static Future<bool> verifyCVV(String cardNumber, String cvvNumber) async {
    var url = "${WebApiBaseUrl}/SignUp/VerifyCVV";
    var body = jsonEncode(<String, String>{
      'cardNumber': cardNumber.toString(),
      'cardCVV': cvvNumber
    });
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

  static Future<bool> signUp() async {
    var url = "${WebApiBaseUrl}/SignUp/SignUp";
    var body = jsonEncode(<String, dynamic>{
      'cardId': SignupData.CurrentSignupData.cardId,
      'countryCode': SignupData.CurrentSignupData.countryCode!,
      'name': SignupData.CurrentSignupData.name!,
      'username': SignupData.CurrentSignupData.username!,
      'password': SignupData.CurrentSignupData.password!,
      'preferredLanguage': "english",
    });
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
}
