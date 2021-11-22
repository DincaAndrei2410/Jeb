import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jaib/style.dart';

class RoundedInputField extends StatefulWidget {
  String hint;
  bool? securedText;
  Function(String?)? onChanged;
  String? initialValue;
  String? currency;
  String? countryFlag;
  bool? isNumerical;
  bool? interactionEnabled;

  RoundedInputField(this.hint,
      {Key? key,
      this.securedText,
      this.onChanged,
      this.initialValue,
      this.currency,
      this.countryFlag,
      this.isNumerical,
      this.interactionEnabled})
      : super(key: key);

  @override
  _RoundedInputFieldState createState() => _RoundedInputFieldState();
}

class _RoundedInputFieldState extends State<RoundedInputField> {
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  FocusNode? focusNode;

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
    focusNode?.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(seconds: 2),
      decoration: focusNode?.hasFocus ?? false
          ? const BoxDecoration(
              boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 20)])
          : null,
      child: Form(
        key: _formKey,
        child: TextFormField(
            enableInteractiveSelection:
                (widget.interactionEnabled ?? true) ? true : false,
            initialValue: widget.initialValue,
            onChanged: (value) => {
                  widget.onChanged != null ? widget.onChanged!(value) : {},
                },
            keyboardType: widget.isNumerical ?? false
                ? TextInputType.number
                : TextInputType.text,
            enableSuggestions: false,
            autocorrect: false,
            obscureText: widget.securedText ?? false,
            style: InputFieldTextStyle,
            focusNode: (widget.interactionEnabled ?? true)
                ? focusNode
                : new AlwaysDisabledFocusNode(),
            decoration: InputDecoration(
                suffix: widget.countryFlag != null
                    ? Image.asset(
                        "assets/images/flags/${widget.countryFlag!}",
                        width: 24,
                        height: 24,
                      )
                    : null,
                floatingLabelBehavior: FloatingLabelBehavior.auto,
                labelText: widget.hint,
                labelStyle: InputHintStyle,
                fillColor: FieldBackgroundColor,
                hoverColor: FieldBackgroundColor,
                filled: true,
                enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(16))),
                focusedBorder: const UnderlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 0.1,
                    )))),
      ),
    );
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
