import 'dart:ffi';

class SignupData {
  static SignupData CurrentSignupData = SignupData();

  int? cardId;
  String? cardNumber;
  String? countryCode;
  String? prefferedLanguage;
  String? name;
  String? username;
  String? password;
}
