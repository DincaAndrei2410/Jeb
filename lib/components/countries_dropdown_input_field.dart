import 'package:flutter/material.dart';
import 'package:jaib/models/country.dart';
import 'package:jaib/services/country_service.dart';
import 'package:jaib/services/signup_data_service.dart';

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
  late Future<List<Country>> futureCountries;
  static List<Country> _dropdownItems = [];
  Country? _dropDownValue;

  @override
  void initState() {
    _dropdownItems.clear();
    futureCountries = CountryService.getCountries();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Country>>(
        future: futureCountries,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            _dropdownItems = snapshot.data!;
            if (_dropDownValue == null) {
              _dropDownValue = _dropdownItems[0];
              SignupData.CurrentSignupData.countryCode = _dropDownValue?.code;
            }

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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16))),
                        ),
                        child: DropdownButton<Country>(
                          dropdownColor: FieldBackgroundColor,
                          value: _dropDownValue,
                          isDense: true,
                          onChanged: (Country? newValue) {
                            setState(() {
                              _dropDownValue = newValue;
                              SignupData.CurrentSignupData.countryCode =
                                  newValue?.code;
                            });
                          },
                          items: _dropdownItems.map((Country value) {
                            return DropdownMenuItem<Country>(
                                value: value,
                                child: Row(children: [
                                  Image.asset(
                                    "assets/images/flags/${CountryService.MapCountryToFlag(value.name)}",
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
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          } else {
            return const CircularProgressIndicator(
              color: GreenColor,
            );
          }
        });
  }
}
