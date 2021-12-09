import 'dart:convert';

import 'package:jaib/consts.dart';
import 'package:jaib/models/country.dart';
import 'package:http/http.dart' as http;

class CountryService {
  static Future<List<Country>> getCountries() async {
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
      return List<Country>.from(body.map((model) => Country.fromJson(model)));
    } else {
      throw Exception('Backend error');
    }
  }

  static MapCountryToFlag(String countryName) {
    if (countryName == "India") return "India.png";
    if (countryName == "Bangladesh") return "Bangladesh.png";
    if (countryName == "Pakistan") return "Pakistan.png";
    if (countryName == "Philippines") return "Philippines.png";
    if (countryName == "Nepal") return "Nepal.png";
    if (countryName == "Sri Lanka") return "SriLanka.png";

    return "India.png";
  }

  static MapCountryCodeToFlag(String countryCode) {
    if (countryCode == "IN") return "India.png";
    if (countryCode == "BD") return "Bangladesh.png";
    if (countryCode == "PK") return "Pakistan.png";
    if (countryCode == "PH") return "Philippines.png";
    if (countryCode == "NP") return "Nepal.png";
    if (countryCode == "LK") return "SriLanka.png";

    return "India.png";
  }
}
