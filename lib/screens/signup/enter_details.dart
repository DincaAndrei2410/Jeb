import 'package:flutter/material.dart';
import 'package:jaib/components/countries_dropdown_input_field.dart';
import 'package:jaib/components/rounded_button.dart';
import 'package:jaib/components/rounded_input_field.dart';
import 'package:jaib/style.dart';

class EnterDetailsPage extends StatelessWidget {
  const EnterDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
            child: Center(
                child: Padding(
          padding: const EdgeInsets.only(top: 32, left: 16, right: 16),
          child: Column(children: [
            Image.asset(
              "assets/images/enter_details_image.png",
              fit: BoxFit.fitHeight,
              width: 150,
            ),
            const SizedBox(height: 30),
            const Text("Enter your details", style: HeadlineTextStyle),
            const SizedBox(height: 30),
            RoundedInputField("Enter your name"),
            const SizedBox(height: 16),
            CountriesDropDownInpuField("Choose your country"),
            const SizedBox(height: 24),
            RoundedButton(
              "Next",
              GreenColor,
              Colors.transparent,
              Colors.white,
            ),
          ]),
        ))));
  }
}
