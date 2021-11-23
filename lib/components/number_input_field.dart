import 'package:flutter/material.dart';
import 'package:jaib/style.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class NumberInputField extends StatefulWidget {
  int length;
  double fieldWidth;
  Function(String?)? onChanged;

  NumberInputField(this.length, this.fieldWidth, {Key? key, this.onChanged})
      : super(key: key);

  @override
  _NumberInputFieldState createState() => _NumberInputFieldState();
}

class _NumberInputFieldState extends State<NumberInputField> {
  String currentText = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PinCodeTextField(
        appContext: context,
        length: widget.length,
        obscureText: false,
        keyboardType: TextInputType.number,
        animationType: AnimationType.none,
        animationDuration: Duration.zero,
        cursorColor: GreenColor,
        pinTheme: PinTheme(
            shape: PinCodeFieldShape.underline,
            activeFillColor: Colors.white,
            fieldWidth: widget.fieldWidth,
            inactiveColor: FieldBackgroundColor,
            activeColor: GreenColor,
            selectedColor: GreenColor),
        onChanged: (value) {
          setState(() {
            currentText = value;
          });
          widget.onChanged != null ? widget.onChanged!(value) : {};
        },
      ),
    );
  }
}
