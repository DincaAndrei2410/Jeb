import 'package:flutter/material.dart';
import 'package:jaib/components/rounded_button.dart';
import 'package:jaib/components/rounded_input_field.dart';
import 'package:jaib/components/underlined_text_button.dart';
import 'package:jaib/screens/signup/enter_details.dart';
import 'package:jaib/screens/signup/onboarding.dart';
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
                      const Text(
                        "Create an username and password",
                        style: HeadlineTextStyle,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 24),
                      RoundedInputField(
                        "Enter your username",
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
                              "Enter your password",
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
                              "Enter your password",
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
                              "Re-enter your password",
                              controller: reEnterPasswordController,
                              securedText: true,
                              onChanged: (text) {
                                reEnteredPassword = text;
                                CheckIsButtonEnabled();
                              },
                              onTapped: () => hasErrors.value = false,
                              errorText: "Password does not match, Try again.",
                              hasErrors: value,
                            );
                          } else {
                            return RoundedInputField(
                              "Re-enter your password",
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
                            "Sign up",
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

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => OnboardingPage()));
  }
}
