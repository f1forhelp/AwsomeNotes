import 'package:awsomeNotes/appUtilities/dimensions.dart';
import 'package:awsomeNotes/services/phoneValidationService.dart';
import 'package:awsomeNotes/views/phoneAuthPage/textInputFieldAuth.dart';
import 'package:awsomeNotes/views/phoneAuthPage/validateButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'bottomClipper.dart';

class PhoneAuthPage extends StatefulWidget {
  @override
  _PhoneAuthPageState createState() => _PhoneAuthPageState();
}

class _PhoneAuthPageState extends State<PhoneAuthPage> {
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  String value = "";
  String phoneNo = "";
  String smsCode = "";
  bool isValidating;
  @override
  void initState() {
    isValidating = false;
    super.initState();
  }

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
            child: SingleChildScrollView(
              child: Form(
                key: formState,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment(0.3, 0),
                      child: SvgPicture.asset(
                        "assets/phoneAuth.svg",
                        width: Dimensions.boxWidth * 30,
                        height: Dimensions.boxHeight * 30,
                      ),
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
                    TextInputFieldAuth(
                      function: (val) {
                        print(val);
                      },
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
                      textStyle:
                          TextStyle(fontSize: Dimensions.boxHeight * 3.5),
                      obsecureText: false,
                      backgroundColor: Theme.of(context).cardColor,
                      length: 6,
                      onChanged: (value) {
                        this.smsCode = value;
                      },
                    ),
                    SizedBox(
                      height: Dimensions.boxHeight * 3,
                    ),
                    ValidateButton(
                      formState: formState,
                    ),
                    RawMaterialButton(
                      onPressed: () {
                        PhoneValidationService.instance()
                            .signInWItOtp(this.smsCode);
                      },
                      child: Text("press me"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
