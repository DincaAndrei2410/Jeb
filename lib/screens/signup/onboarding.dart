import 'package:flutter/material.dart';
import 'package:jaib/components/rounded_button.dart';
import 'package:jaib/components/rounded_input_field.dart';
import 'package:jaib/components/underlined_text_button.dart';
import 'package:jaib/components/view_pager.dart';
import 'package:jaib/models/ViewPagerModel.dart';
import 'package:jaib/screens/login.dart';
import 'package:jaib/screens/signup/enter_details.dart';
import 'package:jaib/style.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Container(
              child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 32),
                        PagerWithDots(ViewPagerModel.OnboardingModels, size),
                        const SizedBox(height: 32),
                        RoundedButton("Ok, got it!", GreenColor,
                            Colors.transparent, Colors.white,
                            onPressed: () => {NavigateToSignup(context)}),
                      ]))),
        ));
  }

  void NavigateToSignup(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
  }
}
