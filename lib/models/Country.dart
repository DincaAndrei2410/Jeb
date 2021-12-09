class Country {
  String name;
  String code;
  String currency;
  double exchangeRate;
  bool transferEnabled;

  Country(this.name, this.code, this.currency, this.exchangeRate,
      this.transferEnabled);

  static Map<String, String> currencyForCountry = {
    "IN": "INR",
    "PK": "PKR",
    "BD": "BDT",
    "NP": "NPR",
    "LK": "LKR",
    "PH": "PHP"
  };

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(json['name'], json['code'], json['currency'],
        json['exchangeRate'], json['transferEnabled']);
  }
}
