import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jaib/style.dart';

class RoundedButton extends StatefulWidget {
  Color backgroundColor;
  Color borderColor;
  String buttonText;
  Color textColor;
  VoidCallback? onPressed;
  bool? isEnabled;

  RoundedButton(
      this.buttonText, this.backgroundColor, this.borderColor, this.textColor,
      {this.onPressed, this.isEnabled, Key? key})
      : super(key: key);

  @override
  State<RoundedButton> createState() => _RoundedButtonState();
}

class _RoundedButtonState extends State<RoundedButton> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 60,
      width: size.width,
      child: ElevatedButton(
        onPressed: (widget.isEnabled ?? true) ? widget.onPressed : null,
        child: Text(widget.buttonText,
            style: TextStyle(
                fontFamily: FontNameDefault,
                fontWeight: FontWeight.w700,
                fontSize: ButtonTextSize,
                color:
                    (widget.isEnabled ?? true) ? widget.textColor : HintColor)),
        style: ButtonStyle(
            backgroundColor: (widget.isEnabled ?? true)
                ? MaterialStateProperty.all<Color>(widget.backgroundColor)
                : MaterialStateProperty.all<Color>(DisabledButtonColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                    side: BorderSide(color: widget.borderColor, width: 2)))),
      ),
    );
  }
}
