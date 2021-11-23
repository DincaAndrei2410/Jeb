import 'package:flutter/material.dart';
import 'package:jaib/components/countries_dropdown_input_field.dart';
import 'package:jaib/components/rounded_button.dart';
import 'package:jaib/components/rounded_input_field.dart';
import 'package:jaib/services/send_money_details.dart';
import 'package:jaib/screens/send_money/transfer_summary.dart';
import 'package:jaib/screens/signup/card_number.dart';
import 'package:jaib/style.dart';

class BankDetailsPage extends StatelessWidget {
  BankDetailsPage({Key? key}) : super(key: key);

  final ValueNotifier<bool> isButtonEnabled = ValueNotifier<bool>(false);

  String? bankName;
  String? accountNumber;
  String? purpose;

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
            const Text("Enter your bank details", style: HeadlineTextStyle),
            const SizedBox(height: 24),
            RoundedInputField(
              "Bank Name",
              onChanged: (text) {
                SaveBankName(text);
                CheckIsButtonEnabled();
              },
            ),
            const SizedBox(height: 8),
            RoundedInputField(
              "Account Number",
              onChanged: (text) {
                SaveAccountNumber(text);
                CheckIsButtonEnabled();
              },
            ),
            const SizedBox(height: 8),
            RoundedInputField(
              "Purpose",
              onChanged: (text) => SavePurpose(text),
            ),
            const SizedBox(height: 24),
            ValueListenableBuilder<bool>(
              builder: (BuildContext context, bool value, Widget? child) {
                return RoundedButton(
                  "Next",
                  GreenColor,
                  Colors.transparent,
                  Colors.white,
                  onPressed: () => NavigateToCardNumber(context),
                  isEnabled: value,
                  key: UniqueKey(),
                );
              },
              valueListenable: isButtonEnabled,
            )
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

  void CheckIsButtonEnabled() {
    isButtonEnabled.value =
        (bankName?.length ?? 0) > 0 && (accountNumber?.length ?? 0) > 0;
  }

  void NavigateToCardNumber(BuildContext context) {
    SendMoneyDetails.LocalSendMoneyDetails.bankName = bankName ?? "";
    SendMoneyDetails.LocalSendMoneyDetails.accountNumber = accountNumber ?? "";
    SendMoneyDetails.LocalSendMoneyDetails.purpose = purpose ?? "";

    Navigator.push(context,
        MaterialPageRoute(builder: (context) => TransferSummaryPage()));
  }
}
