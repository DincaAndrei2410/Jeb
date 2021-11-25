import 'package:flutter/material.dart';
import 'package:jaib/components/countries_dropdown_input_field.dart';
import 'package:jaib/components/rounded_button.dart';
import 'package:jaib/components/rounded_input_field.dart';
import 'package:jaib/components/summary.dart';
import 'package:jaib/services/language_service.dart';
import 'package:jaib/services/send_money_details.dart';
import 'package:jaib/screens/dashboard.dart';
import 'package:jaib/screens/signup/card_number.dart';
import 'package:jaib/style.dart';

import 'bank_details.dart';

class SendMoneyCongratulationsPage extends StatelessWidget {
  const SendMoneyCongratulationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Padding(
      padding: const EdgeInsets.only(top: 32, left: 16, right: 16),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(Strings.MoneyOnTheWay!, style: HeadlineTextStyle),
            const SizedBox(height: 55),
            Image.asset("assets/images/send_money_image.png",
                fit: BoxFit.scaleDown),
            const SizedBox(height: 48),
            RoundedButton(
              Strings.OkGotIt!,
              GreenColor,
              Colors.transparent,
              Colors.white,
              onPressed: () => NavigateToDashboard(context),
            ),
          ]),
    )));
  }

  void NavigateToDashboard(BuildContext context) {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => DashboardPage()),
        (Route<dynamic> r) => false);
  }
}
