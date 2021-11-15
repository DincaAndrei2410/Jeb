import 'package:flutter/material.dart';
import 'package:jaib/components/countries_dropdown_input_field.dart';
import 'package:jaib/components/number_input_field.dart';
import 'package:jaib/components/rounded_button.dart';
import 'package:jaib/components/rounded_input_field.dart';
import 'package:jaib/screens/signup/cvv_number.dart';
import 'package:jaib/style.dart';

class EnterCardNumberPage extends StatelessWidget {
  const EnterCardNumberPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
            child: Center(
                child: Padding(
          padding: const EdgeInsets.only(top: 32, left: 16, right: 16),
          child: Column(children: [
            const Text("Enter card number", style: HeadlineTextStyle),
            const SizedBox(height: 30),
            Image.asset(
              "assets/images/front_card.png",
              fit: BoxFit.fitHeight,
              width: 300,
            ),
            const SizedBox(height: 30),
            NumberInputField(16, 10),
            const SizedBox(height: 32),
            RoundedButton(
              "Next",
              GreenColor,
              Colors.transparent,
              Colors.white,
              onPressed: () => NavigateToCVVNumber(context),
            ),
          ]),
        ))));
  }

  void NavigateToCVVNumber(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => EnterCVVNumberPage()));
  }
}
