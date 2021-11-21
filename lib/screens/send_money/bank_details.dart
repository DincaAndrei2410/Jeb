import 'package:flutter/material.dart';
import 'package:jaib/components/countries_dropdown_input_field.dart';
import 'package:jaib/components/rounded_button.dart';
import 'package:jaib/components/rounded_input_field.dart';
import 'package:jaib/models/SendMoneyDetails.dart';
import 'package:jaib/screens/send_money/transfer_summary.dart';
import 'package:jaib/screens/signup/card_number.dart';
import 'package:jaib/style.dart';

class BankDetailsPage extends StatelessWidget {
  BankDetailsPage({Key? key}) : super(key: key);

  String? bankName;
  String? accountNumber;
  String? purpose;

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
            const Text("Enter your bank details", style: HeadlineTextStyle),
            const SizedBox(height: 24),
            RoundedInputField(
              "Bank Name",
              onChanged: (text) => SaveBankName(text),
            ),
            const SizedBox(height: 8),
            RoundedInputField(
              "Account Number",
              onChanged: (text) => SaveAccountNumber(text),
            ),
            const SizedBox(height: 8),
            RoundedInputField(
              "Purpose",
              onChanged: (text) => SavePurpose(text),
            ),
            const SizedBox(height: 24),
            RoundedButton(
              "Next",
              GreenColor,
              Colors.transparent,
              Colors.white,
              onPressed: () => NavigateToCardNumber(context),
            ),
          ]),
        ))));
  }

  void SaveBankName(String? bankName) {
    this.bankName = bankName ?? "";
  }

  void SaveAccountNumber(String? accountNumber) {
    this.accountNumber = accountNumber ?? "";
  }

  void SavePurpose(String? purpose) {
    this.purpose = purpose ?? "";
  }

  void NavigateToCardNumber(BuildContext context) {
    SendMoneyDetails.LocalStorage.bankName = bankName ?? "";
    SendMoneyDetails.LocalStorage.accountNumber = accountNumber ?? "";
    SendMoneyDetails.LocalStorage.purpose = purpose ?? "";

    Navigator.push(context,
        MaterialPageRoute(builder: (context) => TransferSummaryPage()));
  }
}
