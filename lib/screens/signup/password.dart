import 'package:flutter/material.dart';
import 'package:jaib/components/rounded_button.dart';
import 'package:jaib/components/rounded_input_field.dart';
import 'package:jaib/components/underlined_text_button.dart';
import 'package:jaib/screens/signup/enter_details.dart';
import 'package:jaib/screens/signup/onboarding.dart';
import 'package:jaib/style.dart';

class PasswordPage extends StatelessWidget {
  const PasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 32),
                Image.asset(
                  "assets/images/password.png",
                  fit: BoxFit.cover,
                  width: 160,
                ),
                const SizedBox(height: 4),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Create an username and password",
                        style: HeadlineTextStyle,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 24),
                      RoundedInputField("Enter your username"),
                      const SizedBox(height: 8),
                      RoundedInputField(
                        "Enter your password",
                        securedText: true,
                      ),
                      const SizedBox(height: 8),
                      RoundedInputField(
                        "Re-enter your password",
                        securedText: true,
                      ),
                      const SizedBox(height: 32),
                      RoundedButton("Sign up", GreenColor, Colors.transparent,
                          Colors.white,
                          onPressed: () => {NavigateToOnboarding(context)}),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }

  void NavigateToOnboarding(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => OnboardingPage()));
  }
}
