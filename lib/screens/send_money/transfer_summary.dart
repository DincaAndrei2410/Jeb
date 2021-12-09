import 'package:flutter/material.dart';
import 'package:jaib/components/countries_dropdown_input_field.dart';
import 'package:jaib/components/rounded_button.dart';
import 'package:jaib/components/rounded_input_field.dart';
import 'package:jaib/components/summary.dart';
import 'package:jaib/services/language_service.dart';
import 'package:jaib/services/send_money_details.dart';
import 'package:jaib/screens/signup/card_number.dart';
import 'package:jaib/style.dart';

import 'bank_details.dart';
import 'congratulations.dart';

class TransferSummaryPage extends StatelessWidget {
  const TransferSummaryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: GreenColor,
        ),
        body: SingleChildScrollView(
            child: Center(
                child: Padding(
          padding: const EdgeInsets.only(top: 32, left: 16, right: 16),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(Strings.Summary!, style: HeadlineTextStyle),
            const SizedBox(height: 16),
            Summary(SendMoneyDetails.LocalSendMoneyDetails),
            const SizedBox(height: 24),
            RoundedButton(
              Strings.Confirm!,
              GreenColor,
              Colors.transparent,
              Colors.white,
              onPressed: () => NavigateToCongratulations(context),
            ),
          ]),
        ))));
  }

  void NavigateToCongratulations(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SendMoneyCongratulationsPage()));
  }
}
