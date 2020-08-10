import 'package:awsomeNotes/dimensions.dart';
import 'package:awsomeNotes/views/phoneAuthPage/keyPad.dart';
import 'package:awsomeNotes/views/phoneAuthPage/phoneField.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PhoneAuthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Dimensions(context);

    return Material(
      color: Color(0xFFFCFDFE),
      //color: Colors.black26,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color(0xFFFF595F),
            Color(0xFFE42959),
          ]),
        ),
        child: Column(
          children: [
            Expanded(
              child: Container(
                color: Colors.transparent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: Dimensions.boxHeight * 3),
                  ],
                ),
              ),
            ),
            KeyPad(
              keyListen: (val) {},
            ),
          ],
        ),
      ),
    );
  }
}

class CountrySelect {
  String name;
  String subName;
  String countryCode;
  CountrySelect(this.name, this.subName, this.countryCode);
}

List<CountrySelect> countrySelect = [
  CountrySelect("United States", "us", "+1"),
  CountrySelect("China", "cn", "+86"),
  CountrySelect("Japan", "ja", "+81"),
  CountrySelect("Germany", "ge", "+49"),
  CountrySelect("India", "in", "+91"),
  CountrySelect("United Kingdom", "uk", "+44"),
  CountrySelect("France", "fr", "+33"),
  CountrySelect("Italy", "it", "+39"),
  CountrySelect("Brazil", "br", "+55"),
  CountrySelect("Canada", "ca", "+1"),
  CountrySelect("Russia", "ru", "+7"),
  CountrySelect("Australia", "au", "+43"),
  CountrySelect("Mexico", "me", "+52"),
  CountrySelect("Indonesia", "id", "+62"),
  CountrySelect("Saudi Arabia", "sau", "+966"),
  CountrySelect("Turkey", "tu", "+90"),
  CountrySelect("Switzerland", "sz", "+41"),
  CountrySelect("Pakistan", "pk", "+92"),
];
