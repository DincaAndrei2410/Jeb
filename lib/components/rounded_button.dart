import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jaib/style.dart';

class RoundedButton extends StatelessWidget {
  Color backgroundColor;
  Color borderColor;
  String buttonText;
  Color textColor;
  VoidCallback? onPressed;

  RoundedButton(
      this.buttonText, this.backgroundColor, this.borderColor, this.textColor,
      {this.onPressed, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 60,
      width: size.width,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(buttonText,
            style: TextStyle(
                fontFamily: FontNameDefault,
                fontWeight: FontWeight.w700,
                fontSize: ButtonTextSize,
                color: textColor)),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(backgroundColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                    side: BorderSide(color: borderColor, width: 2)))),
      ),
    );
  }
}
