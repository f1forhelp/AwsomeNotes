import 'package:awsomeNotes/appUtilities/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PhoneAuth extends StatefulWidget {
  @override
  _PhoneAuthState createState() => _PhoneAuthState();
}

class _PhoneAuthState extends State<PhoneAuth> {
  String value = "";

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
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: Dimensions.boxHeight * 35,
                width: double.infinity,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: Dimensions.boxHeight,
                    horizontal: Dimensions.boxWidth * 7),
                child: PinCodeTextField(
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
              ),
              SizedBox(
                height: Dimensions.boxHeight * 3,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(Dimensions.boxHeight * 2),
                ),
                padding: EdgeInsets.symmetric(
                  vertical: Dimensions.boxHeight * 1.5,
                  horizontal: Dimensions.boxWidth * 2.5,
                ),
                child: Text(
                  "VALIDATE",
                  style: TextStyle(
                    fontSize: Dimensions.boxHeight * 2,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class BottomCLipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    Path path = Path();
    path.moveTo(0, size.height * 0.4);
    // path.lineTo(0, size.height);
    // path.lineTo(size.width, size.height);
    // path.lineTo(size.width, 0);
    path.quadraticBezierTo(
      size.width * 0.1,
      size.height * 0.4,
      size.width * 0.25,
      size.height * 0.53,
    );
    path.quadraticBezierTo(
      size.width * 0.4,
      size.height * 0.65,
      size.width * 0.5,
      size.height * 0.7,
    );
    path.quadraticBezierTo(
      size.width * 0.85,
      size.height * 0.9,
      size.width,
      0,
    );
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
    // return oldClipper == BottomCLipper() ? false : true;
  }
}
