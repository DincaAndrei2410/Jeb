class Strings {
  static Language currentLanguage = Language.english;

  static String? WelcomeToJeb;
  static String? PleaseLogIn;
  static String? Username;
  static String? Password;
  static String? Login;
  static String? Or;
  static String? SignUp;
  static String? ChangeTo;
  static String? IncorrectUsernameOrPassword;
  static String? EnterYourDetails;
  static String? EnterYourName;
  static String? ChooseYourCountry;
  static String? EnterCardNumber;
  static String? EnterCVV;
  static String? CreateUsernameAndPassword;
  static String? EnterYourUsername;
  static String? EnterYourPassword;
  static String? ReEnterPassword;
  static String? Next;
  static String? WelcomeToJebYouCanViewBalance;
  static String? SendMoneyAtBestExchange;
  static String? TransferInstantly;
  static String? OkGotIt;
  static String? PasswordDoesNotMatch;
  static String? RecentTransfer;
  static String? SendMoney;
  static String? HowMuchToSend;
  static String? YouSend;
  static String? TheyReceive;
  static String? Today;
  static String? Tomorrow;
  static String? DayAfter;
  static String? RecommendTransferToday;
  static String? NotEnoughBalanceTryAgain;
  static String? SendNow;
  static String? WhoAreYouSendingTo;
  static String? FirstName;
  static String? LastName;
  static String? EnterBankDetails;
  static String? BankName;
  static String? AccountNumber;
  static String? Purpose;
  static String? Summary;
  static String? Confirm;
  static String? MoneyOnTheWay;

  static void FlipLanguage() {
    if (currentLanguage == Language.english) {
      currentLanguage = Language.hindi;
    } else {
      currentLanguage = Language.english;
    }

    InitialiseLanguage();
  }

  static void InitialiseLanguage() {
    if (currentLanguage == Language.english) {
      WelcomeToJeb = "Welcome to Jeb!";
      PleaseLogIn = "Please log in to transfer money now!";
      Username = "Username";
      Password = "Password";
      Login = "Login";
      Or = "or";
      SignUp = "Sign up";
      ChangeTo = "Change to hindi";
      IncorrectUsernameOrPassword =
          "Incorrect username or password, Try again.";
      EnterYourDetails = "Enter your details";
      EnterYourName = "Enter your name";
      ChooseYourCountry = "Choose your country";
      EnterCardNumber = "Enter card number";
      Next = "Next";
      EnterCVV = "Enter CVV";
      CreateUsernameAndPassword = "Create username and password";
      EnterYourUsername = "Enter your username";
      EnterYourPassword = "Enter your password";
      ReEnterPassword = "Re-enter your password";
      WelcomeToJebYouCanViewBalance =
          "Welcome to Jeb! \n\n You can view your balance...";
      SendMoneyAtBestExchange = "Send money at the best exchange rate";
      TransferInstantly = "Transfer instantly using 'Send money' button";
      OkGotIt = "Ok, got it.";
      PasswordDoesNotMatch = "Password does not match. Try again";
      RecentTransfer = "Recent Transfer";
      SendMoney = "Send Money";
      HowMuchToSend = "How much do you want to send?";
      YouSend = "You send";
      TheyReceive = "They receive";
      Today = "Today";
      Tomorrow = "Tomorrow";
      DayAfter = "Day after";
      RecommendTransferToday = "We recommend you transfer today";
      NotEnoughBalanceTryAgain = "You do not have enough balance, try again";
      SendNow = "Send Now";
      WhoAreYouSendingTo = "Who are you sending to?";
      FirstName = "First Name";
      LastName = "Last Name";
      EnterBankDetails = "Enter your bank details";
      BankName = "Bank Name";
      AccountNumber = "Account Number";
      Purpose = "Purpose";
      Summary = "Summary";
      Confirm = "Confirm";
      MoneyOnTheWay = "You money is on the way";
    } else {
      WelcomeToJeb = "जेब में आपका स्वागत है";
      PleaseLogIn = "कृपया अभी पैसे ट्रांसफर करने के लिए लॉग इन करें";
      Username = "उपयोगकर्ता नाम";
      Password = "पासवर्ड";
      Login = "लॉग इन करें";
      Or = "or";
      SignUp = "साइन अप करें";
      ChangeTo = "अंग्रेजी में बदलें";
      IncorrectUsernameOrPassword =
          "गलत उपयोगकर्ता नाम या पासवर्ड, पुन: प्रयास करें।";
      EnterYourDetails = "अपना विवरण दर्ज करें";
      EnterYourName = "अपना नाम दर्ज करें";
      ChooseYourCountry = "अपना देश चुनो";
      EnterCardNumber = "अपना कार्ड नंबर दर्ज करें";
      Next = "अगला";
      EnterCVV = "सीवीवी दर्ज करें";
      CreateUsernameAndPassword = "उपयोगकर्ता नाम और पासवर्ड बनाएं";
      EnterYourUsername = "Enter your username";
      EnterYourPassword = "Enter your password";
      ReEnterPassword = "Re-enter your password";
      WelcomeToJebYouCanViewBalance =
          "जेब में आपका स्वागत है \n\nआप अपना बैलेंस देख सकते हैं...";
      SendMoneyAtBestExchange = "पर पैसे भेजेंसर्वोत्तम विनिमय दर";
      TransferInstantly =
          "'पैसे भेजें' बटन का उपयोग करके तुरंत स्थानांतरण करें";
      OkGotIt = "ठीक मिल गया";
      PasswordDoesNotMatch = "पासवर्ड मेल नहीं खाता, पुनः प्रयास करें";
      RecentTransfer = "हाल ही में स्थानांतरण";
      SendMoney = "पैसे भेजना";
      HowMuchToSend = "आप कितना भेजना चाहते हैं?";
      YouSend = "आप भेजो";
      TheyReceive = "उन्हे मिला";
      Today = "आज";
      Tomorrow = "कल";
      DayAfter = "दिन के बाद";
      RecommendTransferToday =
          "हम अनुशंसा करते हैं कि आप आज ही स्थानांतरण करें";
      NotEnoughBalanceTryAgain =
          "आपके पास काफ़ी बैलेंस नहीं है, फिर से कोशिश करें.";
      SendNow = "अब भेजें";
      WhoAreYouSendingTo = "आप किसे भेज रहे हैं?";
      FirstName = "पहला नाम";
      LastName = "उपनाम";
      EnterBankDetails = "अपना बैंक विवरण दर्ज करें";
      BankName = "बैंक का नाम";
      AccountNumber = "खाता संख्या";
      Purpose = "प्रयोजन";
      Summary = "सारांश";
      Confirm = "पुष्टि करना";
      MoneyOnTheWay = "आपका पैसा रास्ते में है";
    }
  }
}

enum Language { english, hindi }
