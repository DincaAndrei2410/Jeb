import 'dart:convert';

import 'package:jaib/consts.dart';
import 'package:jaib/models/user.dart';
import 'package:jaib/services/signup_data_service.dart';
import 'package:http/http.dart' as http;

import 'current_user_service.dart';

class LoginService {
  static Future<bool> login(String username, String password) async {
    var url = "${WebApiBaseUrl}User/Login";
    var body = jsonEncode(<String, dynamic>{
      'username': username,
      'password': password,
    });
    var headers = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    };

    var response =
        await http.post(Uri.parse(url), body: body, headers: headers);

    if (response.statusCode == 200) {
      var body = json.decode(response.body);
      var user = User.fromJson(body);
      CurrentUserService.currentUser = user;
      return true;
    } else {
      return false;
    }
  }
}
