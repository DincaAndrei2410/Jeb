import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jaib/style.dart';

class UnderlinedTextButton extends StatelessWidget {
  String buttonText;
  Color buttonColor;
  Function? onPressed;

  UnderlinedTextButton(this.buttonText, this.buttonColor,
      {this.onPressed, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
        onPressed: () => {onPressed!()},
        child: Text(buttonText,
            style: TextStyle(
                decoration: TextDecoration.underline,
                fontFamily: FontNameDefault,
                fontWeight: FontWeight.w700,
                fontSize: SubtitleTextSize,
                color: buttonColor)),
      ),
    );
  }
}
