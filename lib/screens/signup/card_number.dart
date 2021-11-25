import 'package:flutter/material.dart';
import 'package:jaib/components/countries_dropdown_input_field.dart';
import 'package:jaib/components/number_input_field.dart';
import 'package:jaib/components/rounded_button.dart';
import 'package:jaib/components/rounded_input_field.dart';
import 'package:jaib/screens/signup/cvv_number.dart';
import 'package:jaib/services/language_service.dart';
import 'package:jaib/style.dart';

class EnterCardNumberPage extends StatelessWidget {
  EnterCardNumberPage({Key? key}) : super(key: key);

  final ValueNotifier<bool> isButtonEnabled = ValueNotifier<bool>(false);

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
            Text(Strings.EnterYourDetails!, style: HeadlineTextStyle),
            const SizedBox(height: 30),
            Image.asset(
              "assets/images/front_card.png",
              fit: BoxFit.fitHeight,
              width: 300,
            ),
            const SizedBox(height: 30),
            NumberInputField(
              16,
              17,
              onChanged: (text) {
                isButtonEnabled.value = (text?.length ?? 0) == 16;
              },
            ),
            const SizedBox(height: 32),
            ValueListenableBuilder<bool>(
              builder: (BuildContext context, bool value, Widget? child) {
                return RoundedButton(
                  Strings.Next!,
                  GreenColor,
                  Colors.transparent,
                  Colors.white,
                  onPressed: () => NavigateToCVVNumber(context),
                  isEnabled: value,
                  key: UniqueKey(),
                );
              },
              valueListenable: isButtonEnabled,
            ),
          ]),
        ))));
  }

  void NavigateToCVVNumber(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => EnterCVVNumberPage()));
  }
}
