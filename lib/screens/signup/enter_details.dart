import 'package:flutter/material.dart';
import 'package:jaib/components/countries_dropdown_input_field.dart';
import 'package:jaib/components/rounded_button.dart';
import 'package:jaib/components/rounded_input_field.dart';
import 'package:jaib/screens/signup/card_number.dart';
import 'package:jaib/services/language_service.dart';
import 'package:jaib/services/signup_data_service.dart';
import 'package:jaib/style.dart';

import 'cvv_number.dart';

class EnterDetailsPage extends StatelessWidget {
  EnterDetailsPage({Key? key}) : super(key: key);

  final ValueNotifier<bool> isButtonEnabled = ValueNotifier<bool>(false);
  String? name;

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
          child: Column(children: [
            Image.asset(
              "assets/images/enter_details_image.png",
              fit: BoxFit.fitHeight,
              width: 150,
            ),
            const SizedBox(height: 30),
            Text(Strings.EnterYourDetails!, style: HeadlineTextStyle),
            const SizedBox(height: 30),
            RoundedInputField(
              Strings.EnterYourName!,
              onChanged: (text) {
                name = text;
                isButtonEnabled.value = (text?.length ?? 0) > 0;
              },
            ),
            const SizedBox(height: 16),
            CountriesDropDownInpuField(Strings.ChooseYourCountry!),
            const SizedBox(height: 24),
            ValueListenableBuilder<bool>(
              builder: (BuildContext context, bool value, Widget? child) {
                return RoundedButton(
                  Strings.Next!,
                  GreenColor,
                  Colors.transparent,
                  Colors.white,
                  onPressed: () => NavigateToCardNumber(context),
                  isEnabled: value,
                  key: UniqueKey(),
                );
              },
              valueListenable: isButtonEnabled,
            ),
          ]),
        ))));
  }

  void NavigateToCardNumber(BuildContext context) {
    SignupData.CurrentSignupData.name = name;
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => EnterCardNumberPage()));
  }
}
