import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jaib/style.dart';

class RoundedInputField extends StatefulWidget {
  String hint;
  bool? securedText;
  Function(String?)? onChanged;

  RoundedInputField(this.hint, {Key? key, this.securedText, this.onChanged})
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
      duration: const Duration(seconds: 5),
      decoration: focusNode?.hasFocus ?? false
          ? const BoxDecoration(
              boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 20)])
          : null,
      child: Form(
        key: _formKey,
        child: TextFormField(
          onChanged: (value) =>
              widget.onChanged != null ? widget.onChanged!(value) : {},
          enableSuggestions: false,
          autocorrect: false,
          obscureText: widget.securedText ?? false,
          style: InputFieldTextStyle,
          focusNode: focusNode,
          decoration: InputDecoration(
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
                  ))),
        ),
      ),
    );
  }
}
