import 'package:flutter/material.dart';
import 'package:jaib/components/countries_dropdown_input_field.dart';
import 'package:jaib/components/rate_container.dart';
import 'package:jaib/components/rounded_button.dart';
import 'package:jaib/components/rounded_input_field.dart';
import 'package:jaib/components/summary.dart';
import 'package:jaib/models/country.dart';
import 'package:jaib/models/user.dart';
import 'package:jaib/services/country_service.dart';
import 'package:jaib/services/current_user_service.dart';
import 'package:jaib/services/language_service.dart';
import 'package:jaib/services/rate_service.dart';
import 'package:jaib/services/send_money_details.dart';
import 'package:jaib/screens/dashboard.dart';
import 'package:jaib/screens/send_money/personal_details.dart';
import 'package:jaib/screens/signup/card_number.dart';
import 'package:jaib/style.dart';

import 'bank_details.dart';

class AmountPage extends StatefulWidget {
  AmountPage({Key? key}) : super(key: key);

  @override
  State<AmountPage> createState() => _AmountPageState();
}

class _AmountPageState extends State<AmountPage> {
  String? amount;
  double? receiveAmount;

  double? rate;

  Map<String, double>? rates;

  double? todayRate;

  User? currentUser;

  final ValueNotifier<double> receiveValue = ValueNotifier<double>(1);
  final ValueNotifier<bool> isButtonEnabled = ValueNotifier<bool>(true);
  final ValueNotifier<bool> hasErrors = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    amount = "1.0";
    rates = RateService.rates;
    todayRate = rates![Strings.Today!];
    currentUser = CurrentUserService.currentUser;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: GreenColor,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Center(
              child: Padding(
            padding: const EdgeInsets.only(top: 32, left: 16, right: 16),
            child: Column(children: [
              Text(Strings.HowMuchToSend!, style: HeadlineTextStyle),
              const SizedBox(height: 24),
              ValueListenableBuilder<bool>(
                builder: (BuildContext context, bool value, Widget? child) {
                  if (value) {
                    return RoundedInputField(
                      Strings.YouSend!,
                      onChanged: (text) => SaveAmount(text),
                      onTapped: () => hasErrors.value = false,
                      initialValue: "1.00",
                      currency: "AED",
                      countryFlag: "UAE.png",
                      isNumerical: true,
                      hasErrors: true,
                      errorText: Strings.NotEnoughBalanceTryAgain!,
                    );
                  } else {
                    return RoundedInputField(
                      Strings.YouSend!,
                      onChanged: (text) => SaveAmount(text),
                      onTapped: () => hasErrors.value = false,
                      initialValue: "1.00",
                      currency: "AED",
                      countryFlag: "UAE.png",
                      isNumerical: true,
                    );
                  }
                },
                valueListenable: hasErrors,
              ),
              const SizedBox(height: 20),
              ValueListenableBuilder<double>(
                builder: (BuildContext context, double value, Widget? child) {
                  receiveAmount = value;
                  var formatReceiveValue = FormatReceiveValue(value);
                  return RoundedInputField(
                    Strings.TheyReceive!,
                    initialValue: formatReceiveValue,
                    countryFlag: CountryService.MapCountryCodeToFlag(
                        currentUser?.countryCode ?? ""),
                    interactionEnabled: false,
                    key: UniqueKey(),
                  );
                },
                valueListenable: receiveValue,
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    "assets/images/amount_rate_icon.png",
                    fit: BoxFit.contain,
                    width: 16,
                    height: 10,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    "Rate: ${todayRate!}",
                    style: BoldSubtitleTextStyle,
                  )
                ],
              ),
              const SizedBox(height: 32),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: rates!.keys
                      .map((e) => RateContainer(
                          Country.currencyForCountry[currentUser?.countryCode]!,
                          rates![e]!.toStringAsFixed(2),
                          e,
                          e == RateService.getKeyForBestRate()))
                      .toList()),
              const SizedBox(height: 24),
              Text(
                "We recommend you transfer ${RateService.getDayForBestRate()}",
                style: InputFieldTextStyle,
              ),
              const SizedBox(height: 24),
              ValueListenableBuilder<bool>(
                builder: (BuildContext context, bool value, Widget? child) {
                  return RoundedButton(
                    Strings.SendNow!,
                    GreenColor,
                    Colors.transparent,
                    Colors.white,
                    onPressed: () => NavigateToDashboard(context),
                    isEnabled: value,
                    key: UniqueKey(),
                  );
                },
                valueListenable: isButtonEnabled,
              )
            ]),
          )),
        ));
  }

  SaveAmount(String? amount) {
    this.amount = amount;
    var parsedValue = double.tryParse(amount!) ?? 0;
    receiveValue.value = parsedValue;
    isButtonEnabled.value = (amount?.length ?? 0) > 0 && parsedValue > 1;
  }

  String FormatReceiveValue(double? amount) {
    return "${((amount ?? 0) * todayRate!).toStringAsFixed(2)} ${Country.currencyForCountry[currentUser?.countryCode]}";
  }

  void NavigateToDashboard(BuildContext context) {
    var parsedAmount = double.tryParse(amount!) ?? 0;

    if (parsedAmount > (currentUser?.card?.balance ?? 0)) {
      hasErrors.value = true;
      return;
    }

    SendMoneyDetails.LocalSendMoneyDetails.country = "India";
    SendMoneyDetails.LocalSendMoneyDetails.sendAmount =
        double.tryParse(amount!);
    SendMoneyDetails.LocalSendMoneyDetails.receiveAmount = receiveAmount;
    SendMoneyDetails.LocalSendMoneyDetails.exchangeRate = todayRate;

    Navigator.push(context,
        MaterialPageRoute(builder: (context) => PersonalDetailsPage()));
  }
}
