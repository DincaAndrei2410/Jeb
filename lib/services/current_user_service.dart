import 'package:jaib/models/user.dart';
import 'package:jaib/services/country_service.dart';

class CurrentUserService {
  static User currentUser = User(CountryService.allCountries
      .firstWhere((country) => country.name == "India"));
}
