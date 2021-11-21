import 'package:flutter/material.dart';
import 'package:jaib/components/countries_dropdown_input_field.dart';
import 'package:jaib/components/rounded_button.dart';
import 'package:jaib/components/rounded_input_field.dart';
import 'package:jaib/components/summary.dart';
import 'package:jaib/models/SendMoneyDetails.dart';
import 'package:jaib/screens/signup/card_number.dart';
import 'package:jaib/style.dart';

import 'bank_details.dart';

class TransferSummaryPage extends StatelessWidget {
  const TransferSummaryPage({Key? key}) : super(key: key);

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
            const Text("Summary", style: HeadlineTextStyle),
            const SizedBox(height: 16),
            Summary(SendMoneyDetails.LocalStorage),
            const SizedBox(height: 24),
            RoundedButton(
              "Confirm",
              GreenColor,
              Colors.transparent,
              Colors.white,
              onPressed: () => NavigateToBankDetailsNumber(context),
            ),
          ]),
        ))));
  }

  void NavigateToBankDetailsNumber(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => BankDetailsPage()));
  }
}
