import 'package:awsomeNotes/appUtilities/dimensions.dart';
import 'package:awsomeNotes/services/phoneValidationService.dart';
import 'package:awsomeNotes/views/phoneAuthPage/validateButton.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'bottomClipper.dart';

class PhoneAuthPage extends StatefulWidget {
  @override
  _PhoneAuthPageState createState() => _PhoneAuthPageState();
}

class _PhoneAuthPageState extends State<PhoneAuthPage> {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  final RegExp phoneRegex = RegExp(r"^[0-9]{8,12}$");
  String value = "";
  String phoneNo = "";

  @override
  Widget build(BuildContext context) {
    Dimensions(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Align(
            alignment: Alignment(0, 1),
            child: ClipPath(
              clipper: BottomCLipper(),
              child: Container(
                width: double.infinity,
                height: Dimensions.boxHeight * 55,
                color: Colors.blueAccent,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: Dimensions.boxHeight,
                horizontal: Dimensions.boxWidth * 7),
            child: Form(
              key: formState,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: Dimensions.boxHeight * 30,
                    width: double.infinity,
                  ),
                  Align(
                    alignment: Alignment(-1, 0),
                    child: Text(
                      "Enter Phone No:",
                      style: TextStyle(
                        fontSize: Dimensions.boxHeight * 2,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Dimensions.boxHeight,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    style: TextStyle(
                      fontSize: Dimensions.boxHeight * 3,
                      fontWeight: FontWeight.w700,
                    ),
                    autovalidate: true,
                    onChanged: (value) {
                      PhoneValidationService.instance().phoneNo = value;
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
                      errorStyle: TextStyle(
                          fontSize: Dimensions.boxHeight * 2,
                          fontWeight: FontWeight.w500),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: Dimensions.boxHeight * 2,
                        horizontal: Dimensions.boxWidth * 2,
                      ),
                      prefixIcon: Icon(Icons.phone),
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(Dimensions.boxHeight * 2),
                      ),
                    ),
                  ),
                  SizedBox(height: Dimensions.boxHeight * 6),
                  PinCodeTextField(
                    pinTheme: PinTheme(
                      fieldHeight: Dimensions.boxHeight * 7,
                      fieldWidth: Dimensions.boxWidth * 5.5,
                      shape: PinCodeFieldShape.box,
                      borderRadius:
                          BorderRadius.circular(Dimensions.boxHeight * 2),
                    ),
                    textStyle: TextStyle(fontSize: Dimensions.boxHeight * 3.5),
                    obsecureText: false,
                    backgroundColor: Theme.of(context).cardColor,
                    length: 6,
                    onChanged: (value) {
                      this.value = value;
                    },
                  ),
                  SizedBox(
                    height: Dimensions.boxHeight * 3,
                  ),
                  ValidateButton(
                    formState: formState,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
