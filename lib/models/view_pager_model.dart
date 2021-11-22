class ViewPagerModel {
  String title;
  String imagePath;

  static List<ViewPagerModel> OnboardingModels = [
    new ViewPagerModel(
        "Welcome to Jeb! \n You can view your balance...", "onboarding1.png"),
    new ViewPagerModel(
        "Send money at the best exchange rate", "onboarding2.png"),
    new ViewPagerModel(
        "Transfer instantly using “Send money” button ", "onboarding3.png")
  ];

  ViewPagerModel(this.title, this.imagePath);
}
