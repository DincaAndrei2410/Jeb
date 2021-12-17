import 'dart:convert';

import 'package:jaib/models/country.dart';
import 'package:jaib/services/current_user_service.dart';

import '../consts.dart';
import 'language_service.dart';

import 'package:http/http.dart' as http;

class RateService {
  static Future<bool> getRates() async {
    var url = "${WebApiBaseUrl}Country";
    var body =
        jsonEncode(<String, String>{'date': DateTime.now().toIso8601String()});
    var headers = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    };

    var response =
        await http.post(Uri.parse(url), body: body, headers: headers);

    if (response.statusCode == 200) {
      var body = json.decode(response.body);
      var countries =
          List<Country>.from(body.map((model) => Country.fromJson(model)));
      var rate = countries
          .firstWhere((country) =>
              country.code == CurrentUserService.currentUser?.countryCode)
          .exchangeRate;
      rates[Strings.Today!] = rate;
    } else {
      return false;
    }

    body = jsonEncode(<String, String>{
      'date': DateTime.now().add(const Duration(days: 1)).toIso8601String()
    });

    response = await http.post(Uri.parse(url), body: body, headers: headers);

    if (response.statusCode == 200) {
      var body = json.decode(response.body);
      var countries =
          List<Country>.from(body.map((model) => Country.fromJson(model)));
      var rate = countries
          .firstWhere((country) =>
              country.code == CurrentUserService.currentUser?.countryCode)
          .exchangeRate;
      rates[Strings.Tomorrow!] = rate;
    } else {
      return false;
    }

    body = jsonEncode(<String, String>{
      'date': DateTime.now().add(const Duration(days: 2)).toIso8601String()
    });

    response = await http.post(Uri.parse(url), body: body, headers: headers);

    if (response.statusCode == 200) {
      var body = json.decode(response.body);
      var countries =
          List<Country>.from(body.map((model) => Country.fromJson(model)));
      var rate = countries
          .firstWhere((country) =>
              country.code == CurrentUserService.currentUser?.countryCode)
          .exchangeRate;
      rates[Strings.DayAfter!] = rate;
    } else {
      return false;
    }

    return true;
  }

  static String getDayForBestRate() {
    if ((rates[Strings.Today!] ?? 0) > (rates[Strings.Tomorrow!] ?? 0)) {
      if ((rates[Strings.Today!] ?? 0) > (rates[Strings.DayAfter!] ?? 0)) {
        return "today";
      } else {
        return "the day after";
      }
    } else if ((rates[Strings.Tomorrow!] ?? 0) >
        (rates[Strings.DayAfter!] ?? 0)) {
      return "tomorrow";
    } else {
      return "the day after";
    }
  }

  static String getKeyForBestRate() {
    var day = getDayForBestRate();

    if (day == "today") {
      return Strings.Today!;
    } else if (day == "tomorrow") {
      return Strings.Tomorrow!;
    } else {
      return Strings.DayAfter!;
    }
  }

  static Map<String, double> rates = {
    Strings.Today!: 20.21,
    Strings.Tomorrow!: 19.21,
    Strings.DayAfter!: 19.88
  };
}
