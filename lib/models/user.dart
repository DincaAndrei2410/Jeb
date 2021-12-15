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
  String countryCode;
  String preferredLanguage;

  User(this.card, this.name, this.id, this.preferredLanguage, this.countryCode);

  factory User.fromJson(Map<String, dynamic> json) {
    return User(Card.fromJson(json['card']), json['name'], json['id'],
        json['preferredLanguage'], json['countryCode']);
  }
}
