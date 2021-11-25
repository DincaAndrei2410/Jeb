import 'package:flutter/material.dart';
import 'package:jaib/components/rounded_button.dart';
import 'package:jaib/components/rounded_input_field.dart';
import 'package:jaib/components/underlined_text_button.dart';
import 'package:jaib/screens/dashboard.dart';
import 'package:jaib/screens/signup/enter_details.dart';
import 'package:jaib/screens/signup/onboarding.dart';
import 'package:jaib/services/language_service.dart';
import 'package:jaib/style.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final ValueNotifier<bool> isButtonEnabled = ValueNotifier<bool>(false);

  int? usernameLength;

  int? passwordLength;

  @override
  Widget build(BuildContext context) {
    Strings.InitialiseLanguage();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              "assets/images/login_image.png",
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(Strings.WelcomeToJeb!, style: HeadlineTextStyle),
                  const SizedBox(height: 6),
                  Text(Strings.PleaseLogIn!, style: SubtitleTextStyle),
                  const SizedBox(height: 16),
                  RoundedInputField(
                    Strings.Username!,
                    onChanged: (text) {
                      usernameLength = text?.length;
                      isButtonEnabled.value = ((usernameLength ?? 0) > 0) &&
                          ((passwordLength ?? 0) > 0);
                    },
                  ),
                  const SizedBox(height: 16),
                  RoundedInputField(
                    Strings.Password!,
                    onChanged: (text) {
                      passwordLength = text?.length;
                      isButtonEnabled.value = ((usernameLength ?? 0) > 0) &&
                          ((passwordLength ?? 0) > 0);
                    },
                    securedText: true,
                  ),
                  const SizedBox(height: 32),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ValueListenableBuilder<bool>(
                        builder:
                            (BuildContext context, bool value, Widget? child) {
                          return RoundedButton(
                            Strings.Login!,
                            GreenColor,
                            Colors.transparent,
                            Colors.white,
                            onPressed: () => NavigateToDashboard(context),
                            isEnabled: value,
                            key: UniqueKey(),
                          );
                        },
                        valueListenable: isButtonEnabled,
                      ),
                      const SizedBox(height: 8),
                      Text(Strings.Or!, style: SubtitleTextStyle),
                      const SizedBox(height: 8),
                      RoundedButton(
                          Strings.SignUp!, Colors.white, GreenColor, GreenColor,
                          onPressed: () => NavigateToSignup(context)),
                      const SizedBox(height: 24),
                      UnderlinedTextButton(
                        Strings.ChangeTo!,
                        GreenColor,
                        onPressed: () {
                          Strings.FlipLanguage();
                          setState(() {});
                        },
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }

  void NavigateToSignup(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => EnterDetailsPage()));
  }

  void NavigateToDashboard(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => DashboardPage()));
  }
}
