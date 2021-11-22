class Country {
  String name;
  String flag;

  Country(this.name, this.flag);

  static Map<String, String> currencyForCountry = {
    "India": "INR",
    "Pakistan": "PKR",
    "Bangladesh": "BDT",
    "Nepal": "NPR",
    "Sri Lanka": "LKR",
    "Philippines": "PHP"
  };
}
