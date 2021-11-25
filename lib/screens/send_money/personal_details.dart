import 'package:flutter/material.dart';
import 'package:jaib/components/countries_dropdown_input_field.dart';
import 'package:jaib/components/rounded_button.dart';
import 'package:jaib/components/rounded_input_field.dart';
import 'package:jaib/services/language_service.dart';
import 'package:jaib/services/send_money_details.dart';
import 'package:jaib/screens/signup/card_number.dart';
import 'package:jaib/style.dart';

import 'bank_details.dart';

class PersonalDetailsPage extends StatelessWidget {
  PersonalDetailsPage({Key? key}) : super(key: key);

  final ValueNotifier<bool> isButtonEnabled = ValueNotifier<bool>(false);

  String? firstName;
  String? lastName;

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
            Text(Strings.WhoAreYouSendingTo!, style: HeadlineTextStyle),
            const SizedBox(height: 24),
            RoundedInputField(Strings.FirstName!, onChanged: (text) {
              SaveFirstName(text);
              CheckIsButtonEnabled();
            }),
            const SizedBox(height: 8),
            RoundedInputField(
              Strings.LastName!,
              onChanged: (text) {
                SaveLastName(text);
                CheckIsButtonEnabled();
              },
            ),
            const SizedBox(height: 24),
            ValueListenableBuilder<bool>(
              builder: (BuildContext context, bool value, Widget? child) {
                return RoundedButton(
                  Strings.Next!,
                  GreenColor,
                  Colors.transparent,
                  Colors.white,
                  onPressed: () => NavigateToBankDetailsNumber(context),
                  isEnabled: value,
                  key: UniqueKey(),
                );
              },
              valueListenable: isButtonEnabled,
            )
          ]),
        ))));
  }

  void SaveFirstName(String? firstName) {
    this.firstName = firstName ?? "";
  }

  void SaveLastName(String? lastName) {
    this.lastName = lastName ?? "";
  }

  void CheckIsButtonEnabled() {
    isButtonEnabled.value =
        (firstName?.length ?? 0) > 0 && (lastName?.length ?? 0) > 0;
  }

  void NavigateToBankDetailsNumber(BuildContext context) {
    SendMoneyDetails.LocalSendMoneyDetails.name =
        "${firstName ?? ""} ${lastName ?? ""}";
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => BankDetailsPage()));
  }
}
