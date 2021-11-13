import 'package:flutter/material.dart';

const LargeTextSize = 24.0;
const ButtonTextSize = 18.0;
const MediumTextSize = 16.0;
const SubtitleTextSize = 12.0;

const String FontNameDefault = 'Montserrat';

const HeadlineColor = Color.fromARGB(255, 13, 52, 67);
const SubtitleColor = Color.fromARGB(255, 119, 126, 127);
const HintColor = Color.fromARGB(255, 174, 182, 183);
const FieldBackgroundColor = Color.fromARGB(255, 242, 242, 242);

const GreenColor = Color.fromARGB(255, 26, 71, 89);
const NotFilledButtonColor = Color.fromARGB(255, 26, 71, 89);
const DisabledButtonColor = Color.fromARGB(255, 241, 244, 244);

const HeadlineTextStyle = TextStyle(
  fontFamily: FontNameDefault,
  fontWeight: FontWeight.w700,
  fontSize: LargeTextSize,
  color: HeadlineColor,
);

const SubtitleTextStyle = TextStyle(
    fontFamily: FontNameDefault,
    fontWeight: FontWeight.w500,
    fontSize: SubtitleTextSize,
    color: SubtitleColor);

const InputHintStyle = TextStyle(
    fontFamily: FontNameDefault,
    fontWeight: FontWeight.w500,
    fontSize: MediumTextSize,
    color: HintColor);

const FloatingHintStyle = TextStyle(
    fontFamily: FontNameDefault,
    fontWeight: FontWeight.w500,
    fontSize: SubtitleTextSize,
    color: HintColor);

const InputFieldTextStyle = TextStyle(
    fontFamily: FontNameDefault,
    fontWeight: FontWeight.w700,
    fontSize: MediumTextSize,
    color: HeadlineColor);

const ButtonTextStyle = TextStyle(
    fontFamily: FontNameDefault,
    fontWeight: FontWeight.w500,
    fontSize: ButtonTextSize);
