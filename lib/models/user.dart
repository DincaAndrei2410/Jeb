import 'country.dart';

class Card {
  int id;
  String number;
  String cvv;
  double balance;

  Card(this.id, this.number, this.cvv, this.balance);

  factory Card.fromJson(Map<String, dynamic> json) {
    return Card(json['id'], json['number'], json['cvv'], json['balance']);
  }
}

class User {
  Card card;
  String name;
  String id;
  String username;
  String normalizedUserName;
  String email;
  String normalizedEmail;
  bool emailConfirmed;
  String passwordHash;
  String securityStamp;
  String concurrencyStamp;
  String phoneNumber;
  String phoneNumberConfirmed;
  bool twoFactorEnabled;
  String lockoutEnd;
  bool lockoutEnabled;
  int accessFailedCount;
  int cardId;
  String countryCode;
  String preferredLanguage;

  User(
      this.card,
      this.name,
      this.id,
      this.username,
      this.normalizedUserName,
      this.email,
      this.normalizedEmail,
      this.emailConfirmed,
      this.passwordHash,
      this.securityStamp,
      this.concurrencyStamp,
      this.phoneNumber,
      this.phoneNumberConfirmed,
      this.twoFactorEnabled,
      this.lockoutEnabled,
      this.lockoutEnd,
      this.accessFailedCount,
      this.cardId,
      this.preferredLanguage,
      this.countryCode);

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        Card.fromJson(json['card']),
        json['name'],
        json['id'],
        json['username'],
        json['normalizedUserName'],
        json['email'],
        json['normalizedEmail'],
        json['emailConfirmed'],
        json['passwordHash'],
        json['securityStamp'],
        json['concurrencyStamp'],
        json['phoneNumber'],
        json['phoneNumberConfirmed'],
        json['twoFactorEnabled'],
        json['lockoutEnabled'],
        json['lockoutEnd'],
        json['accessFailedCount'],
        json['cardId'],
        json['preferredLanguage'],
        json['countryCode']);
  }
}
