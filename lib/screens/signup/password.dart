import 'package:flutter/material.dart';
import 'package:jaib/components/rounded_button.dart';
import 'package:jaib/components/rounded_input_field.dart';
import 'package:jaib/components/underlined_text_button.dart';
import 'package:jaib/screens/signup/enter_details.dart';
import 'package:jaib/screens/signup/onboarding.dart';
import 'package:jaib/services/language_service.dart';
import 'package:jaib/services/signup_data_service.dart';
import 'package:jaib/services/signup_service.dart';
import 'package:jaib/style.dart';

class PasswordPage extends StatelessWidget {
  PasswordPage({Key? key}) : super(key: key);

  final ValueNotifier<bool> isButtonEnabled = ValueNotifier<bool>(false);
  final ValueNotifier<bool> hasErrors = ValueNotifier<bool>(false);

  String? username;
  String? password;
  String? reEnteredPassword;

  TextEditingController passwordController = TextEditingController();
  TextEditingController? reEnterPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: GreenColor,
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 32),
                Image.asset(
                  "assets/images/password.png",
                  fit: BoxFit.cover,
                  width: 160,
                ),
                const SizedBox(height: 4),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Strings.CreateUsernameAndPassword!,
                        style: HeadlineTextStyle,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 24),
                      RoundedInputField(
                        Strings.EnterYourUsername!,
                        onChanged: (text) {
                          username = text;
                          CheckIsButtonEnabled();
                        },
                      ),
                      const SizedBox(height: 16),
                      ValueListenableBuilder<bool>(
                        builder:
                            (BuildContext context, bool value, Widget? child) {
                          if (value) {
                            return RoundedInputField(
                              Strings.EnterYourPassword!,
                              controller: passwordController,
                              securedText: true,
                              onChanged: (text) {
                                password = text;
                                CheckIsButtonEnabled();
                              },
                              onTapped: () => hasErrors.value = false,
                              errorText: " ",
                              hasErrors: value,
                            );
                          } else {
                            return RoundedInputField(
                              Strings.EnterYourPassword!,
                              controller: passwordController,
                              securedText: true,
                              onChanged: (text) {
                                password = text;
                                CheckIsButtonEnabled();
                              },
                              onTapped: () => hasErrors.value = false,
                            );
                          }
                        },
                        valueListenable: hasErrors,
                      ),
                      const SizedBox(height: 16),
                      ValueListenableBuilder<bool>(
                        builder:
                            (BuildContext context, bool value, Widget? child) {
                          if (value) {
                            return RoundedInputField(
                              Strings.ReEnterPassword!,
                              controller: reEnterPasswordController,
                              securedText: true,
                              onChanged: (text) {
                                reEnteredPassword = text;
                                CheckIsButtonEnabled();
                              },
                              onTapped: () => hasErrors.value = false,
                              errorText: Strings.PasswordDoesNotMatch!,
                              hasErrors: value,
                            );
                          } else {
                            return RoundedInputField(
                              Strings.ReEnterPassword!,
                              controller: reEnterPasswordController,
                              securedText: true,
                              onChanged: (text) {
                                reEnteredPassword = text;
                                CheckIsButtonEnabled();
                              },
                              onTapped: () => hasErrors.value = false,
                            );
                          }
                        },
                        valueListenable: hasErrors,
                      ),
                      const SizedBox(height: 32),
                      ValueListenableBuilder<bool>(
                        builder:
                            (BuildContext context, bool value, Widget? child) {
                          return RoundedButton(
                            Strings.SignUp!,
                            GreenColor,
                            Colors.transparent,
                            Colors.white,
                            onPressed: () => {NavigateToOnboarding(context)},
                            isEnabled: value,
                            key: UniqueKey(),
                          );
                        },
                        valueListenable: isButtonEnabled,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }

  void CheckIsButtonEnabled() {
    isButtonEnabled.value = (username?.length ?? 0) > 0 &&
        (password?.length ?? 0) > 0 &&
        (reEnteredPassword?.length ?? 0) > 0;
  }

  void NavigateToOnboarding(BuildContext context) {
    hasErrors.value = password != reEnteredPassword;
    if (hasErrors.value) {
      passwordController?.clear();
      reEnterPasswordController?.clear();
      return;
    }

    SignupData.CurrentSignupData.password = password;
    SignupData.CurrentSignupData.username = username;

    SignupService.signUp().then((value) => {
          if (value)
            {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => OnboardingPage()))
            }
          else
            {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                        content: Text(
                            "Failed to create new account. Try again later!",
                            style: BoldMediumSizeTextStyle));
                  })
            }
        });
  }
}
