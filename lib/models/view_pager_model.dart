import 'package:jaib/services/language_service.dart';

class ViewPagerModel {
  String title;
  String imagePath;

  static List<ViewPagerModel> OnboardingModels = [
    new ViewPagerModel(
        Strings.WelcomeToJebYouCanViewBalance!, "onboarding1.png"),
    new ViewPagerModel(Strings.SendMoneyAtBestExchange!, "onboarding2.png"),
    new ViewPagerModel(Strings.TransferInstantly!, "onboarding3.png")
  ];

  ViewPagerModel(this.title, this.imagePath);
}
