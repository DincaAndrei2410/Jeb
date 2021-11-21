import 'package:flutter/material.dart';
import 'package:jaib/components/countries_dropdown_input_field.dart';
import 'package:jaib/components/rounded_button.dart';
import 'package:jaib/components/rounded_input_field.dart';
import 'package:jaib/models/SendMoneyDetails.dart';
import 'package:jaib/screens/signup/card_number.dart';
import 'package:jaib/style.dart';

import 'bank_details.dart';

class PersonalDetailsPage extends StatelessWidget {
  PersonalDetailsPage({Key? key}) : super(key: key);

  String? firstName;
  String? lastName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
            child: Center(
                child: Padding(
          padding: const EdgeInsets.only(top: 32, left: 16, right: 16),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text("Who are you sending to?", style: HeadlineTextStyle),
            const SizedBox(height: 24),
            RoundedInputField("First Name",
                onChanged: (text) => SaveFirstName(text)),
            const SizedBox(height: 8),
            RoundedInputField(
              "Last Name",
              onChanged: (text) => SaveLastName(text),
            ),
            const SizedBox(height: 24),
            RoundedButton(
              "Next",
              GreenColor,
              Colors.transparent,
              Colors.white,
              onPressed: () => NavigateToBankDetailsNumber(context),
            ),
          ]),
        ))));
  }

  void SaveFirstName(String? firstName) {
    this.firstName = firstName ?? "";
  }

  void SaveLastName(String? lastName) {
    this.lastName = lastName ?? "";
  }

  void NavigateToBankDetailsNumber(BuildContext context) {
    SendMoneyDetails.LocalStorage.name = "${firstName ?? ""} ${lastName ?? ""}";
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => BankDetailsPage()));
  }
}
