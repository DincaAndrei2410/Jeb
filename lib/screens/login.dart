import 'package:flutter/material.dart';
import 'package:jaib/components/rounded_button.dart';
import 'package:jaib/components/rounded_input_field.dart';
import 'package:jaib/components/underlined_text_button.dart';
import 'package:jaib/screens/signup/enter_details.dart';
import 'package:jaib/style.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  const Text("Welcome to Jeb!", style: HeadlineTextStyle),
                  const SizedBox(height: 6),
                  const Text("Please log in to transfer money now!",
                      style: SubtitleTextStyle),
                  const SizedBox(height: 16),
                  RoundedInputField("Username"),
                  const SizedBox(height: 16),
                  RoundedInputField(
                    "Password",
                    securedText: true,
                  ),
                  const SizedBox(height: 32),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      RoundedButton(
                          "Login", GreenColor, Colors.transparent, Colors.white,
                          onPressed: () => NavigateToSignup(context)),
                      const SizedBox(height: 8),
                      const Text("or", style: SubtitleTextStyle),
                      const SizedBox(height: 8),
                      RoundedButton(
                          "Sign up", Colors.white, GreenColor, GreenColor,
                          onPressed: () => NavigateToSignup(context)),
                      const SizedBox(height: 24),
                      UnderlinedTextButton("Change to hindi", GreenColor)
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
}
