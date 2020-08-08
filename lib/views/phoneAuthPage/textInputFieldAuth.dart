import 'package:awsomeNotes/appUtilities/dimensions.dart';
import 'package:awsomeNotes/services/phoneValidationService.dart';
import 'package:flutter/material.dart';

class TextInputFieldAuth extends StatelessWidget {
  final RegExp phoneRegex = RegExp(r"^[0-9]{8,12}$");
  final Function(String str) function;

  TextInputFieldAuth({this.function});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.number,
      style: TextStyle(
        fontSize: Dimensions.boxHeight * 3,
        fontWeight: FontWeight.w700,
      ),
      autovalidate: true,
      onChanged: (value) {
        PhoneValidationService.instance().phoneNo = value;
        return function(value);
      },
      validator: (value) {
        if (this.phoneRegex.hasMatch(value)) {
          return null;
        } else
          return "Invalid Input";
      },
      autocorrect: false,
      //keyboardType: TextInputType.number,
      decoration: InputDecoration(
        suffixIcon: IconButton(
            icon: Icon(Icons.ac_unit),
            onPressed: () async {
              await PhoneValidationService.instance().verifyPhone();
            }),
        errorStyle: TextStyle(
            fontSize: Dimensions.boxHeight * 2, fontWeight: FontWeight.w500),
        contentPadding: EdgeInsets.symmetric(
          vertical: Dimensions.boxHeight * 2,
          horizontal: Dimensions.boxWidth * 2,
        ),
        prefixIcon: Icon(Icons.phone),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Dimensions.boxHeight * 2),
        ),
      ),
    );
  }
}
