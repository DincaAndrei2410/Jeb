import 'package:flutter/material.dart';
import 'package:jaib/components/number_input_field.dart';
import 'package:jaib/components/rounded_button.dart';
import 'package:jaib/screens/signup/password.dart';
import 'package:jaib/style.dart';

class EnterCVVNumberPage extends StatelessWidget {
  const EnterCVVNumberPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
            child: Center(
                child: Padding(
          padding: const EdgeInsets.only(top: 32, left: 16, right: 16),
          child: Column(children: [
            const Text("Enter CVV", style: HeadlineTextStyle),
            const SizedBox(height: 30),
            Image.asset(
              "assets/images/back_card.png",
              fit: BoxFit.fitHeight,
              width: 300,
            ),
            const SizedBox(height: 30),
            Padding(
                padding: const EdgeInsets.only(left: 80, right: 80),
                child: NumberInputField(3, 36)),
            const SizedBox(height: 32),
            RoundedButton("Next", GreenColor, Colors.transparent, Colors.white,
                onPressed: () => NavigateToPassword(context))
          ]),
        ))));
  }

  void NavigateToPassword(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => PasswordPage()));
  }
}
