import 'package:flutter/material.dart';
import 'package:jaib/models/country.dart';
import 'package:jaib/services/country_service.dart';

import '../style.dart';

class CountriesDropDownInpuField extends StatefulWidget {
  String hint;
  CountriesDropDownInpuField(this.hint, {Key? key}) : super(key: key);

  @override
  _CountriesDropDownInpuFieldState createState() =>
      _CountriesDropDownInpuFieldState();
}

class _CountriesDropDownInpuFieldState
    extends State<CountriesDropDownInpuField> {
  static List<Country> _dropdownItems = [];
  Country? _dropDownValue;

  @override
  void initState() {
    _dropdownItems.clear();
    _dropdownItems = CountryService.allCountries.toList();
    _dropDownValue = _dropdownItems[0];
  }

  @override
  Widget build(BuildContext context) {
    return FormField(
      builder: (FormFieldState state) {
        return DropdownButtonHideUnderline(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              InputDecorator(
                decoration: InputDecoration(
                  fillColor: FieldBackgroundColor,
                  hoverColor: FieldBackgroundColor,
                  filled: true,
                  labelText: widget.hint,
                  labelStyle: InputHintStyle,
                  enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(16))),
                ),
                child: DropdownButton<Country>(
                  dropdownColor: FieldBackgroundColor,
                  value: _dropDownValue,
                  isDense: true,
                  onChanged: (Country? newValue) {
                    setState(() {
                      _dropDownValue = newValue;
                    });
                  },
                  items: _dropdownItems.map((Country value) {
                    return DropdownMenuItem<Country>(
                        value: value,
                        child: Row(children: [
                          Image.asset(
                            "assets/images/flags/${value.flag}",
                            width: 20,
                            height: 20,
                          ),
                          const SizedBox(width: 12),
                          Text(
                            value.name,
                            style: InputFieldTextStyle,
                          )
                        ]));
                  }).toList(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
