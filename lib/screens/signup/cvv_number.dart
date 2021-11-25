import 'package:flutter/material.dart';
import 'package:jaib/components/number_input_field.dart';
import 'package:jaib/components/rounded_button.dart';
import 'package:jaib/screens/signup/password.dart';
import 'package:jaib/services/language_service.dart';
import 'package:jaib/style.dart';

class EnterCVVNumberPage extends StatelessWidget {
  EnterCVVNumberPage({Key? key}) : super(key: key);

  final ValueNotifier<bool> isButtonEnabled = ValueNotifier<bool>(false);

  String? cvv;

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
            Text(Strings.EnterCVV!, style: HeadlineTextStyle),
            const SizedBox(height: 30),
            Image.asset(
              "assets/images/back_card.png",
              fit: BoxFit.fitHeight,
              width: 300,
            ),
            const SizedBox(height: 30),
            Padding(
                padding: const EdgeInsets.only(left: 80, right: 80),
                child: NumberInputField(
                  3,
                  36,
                  onChanged: (text) {
                    cvv = text;
                    isButtonEnabled.value = (text?.length ?? 0) == 3;
                  },
                )),
            const SizedBox(height: 32),
            ValueListenableBuilder<bool>(
              builder: (BuildContext context, bool value, Widget? child) {
                return RoundedButton(
                  Strings.Next!,
                  GreenColor,
                  Colors.transparent,
                  Colors.white,
                  onPressed: () => NavigateToPassword(context),
                  isEnabled: value,
                  key: UniqueKey(),
                );
              },
              valueListenable: isButtonEnabled,
            )
          ]),
        ))));
  }

  void NavigateToPassword(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => PasswordPage()));
  }
}
