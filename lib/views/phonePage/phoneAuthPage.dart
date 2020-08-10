import 'package:awsomeNotes/dimensions.dart';
import 'package:awsomeNotes/providers/otpProvider.dart';
import 'package:awsomeNotes/providers/phoneProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../widgets/keyPad.dart';
import 'countryDialogue.dart';

class PhoneAuthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _obj = Provider.of<PhoneProvider>(context, listen: false);
    Dimensions(context);
    return Material(
      color: Color(0xFFFCFDFE),
      //color: Colors.black26,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment(0, 0),
              end: Alignment(1, 1),
              colors: [
                Colors.purple.shade900,
                Colors.pink.shade400,
              ]),
        ),
        child: Column(
          children: [
            Expanded(
              child: Container(
                color: Colors.transparent,
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: Dimensions.boxHeight * 27,
                      color: Colors.white24,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: Dimensions.boxHeight * 11),
                        Align(
                          alignment: Alignment(0, 0),
                          child: Container(
                            padding: EdgeInsets.all(Dimensions.boxHeight * 3),
                            width: Dimensions.boxWidth * 85,
                            // height: Dimensions.boxHeight * 30,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  spreadRadius: Dimensions.boxHeight * 1,
                                  blurRadius: Dimensions.boxHeight * 3,
                                ),
                              ],
                              borderRadius: BorderRadius.circular(
                                Dimensions.boxHeight * 1,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Login",
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: Dimensions.boxHeight * 3,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(
                                  height: Dimensions.boxHeight * 2,
                                ),
                                Text(
                                  "We will send you a one time OTP",
                                  style: TextStyle(
                                    fontSize: Dimensions.boxHeight * 2.1,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black54,
                                  ),
                                ),
                                SizedBox(
                                  height: Dimensions.boxHeight * 0.5,
                                ),
                                Text(
                                  "Carrier charge may apply.",
                                  style: TextStyle(
                                    fontSize: Dimensions.boxHeight * 2.1,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black54,
                                  ),
                                ),
                                SizedBox(
                                  height: Dimensions.boxHeight * 2.4,
                                ),
                                CountryDialogue(),
                                SizedBox(
                                  height: Dimensions.boxHeight * 1.2,
                                ),
                                Text(
                                  "Tap above to change Country",
                                  style: TextStyle(
                                    fontSize: Dimensions.boxHeight * 2.1,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black54,
                                  ),
                                ),
                                SizedBox(
                                  height: Dimensions.boxHeight * 3,
                                ),
                                Align(
                                  alignment: Alignment(1, 0),
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      child: Text(
                                        "SUBMIT",
                                        style: TextStyle(
                                          fontSize: Dimensions.boxHeight * 2,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w800,
                                          letterSpacing: 1,
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            Dimensions.boxHeight * 0.8),
                                        color: Color(0xFFE42959),
                                      ),
                                      padding: EdgeInsets.symmetric(
                                        vertical: Dimensions.boxHeight * 1.3,
                                        horizontal: Dimensions.boxHeight * 2,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            KeyPad(
              keyListen: (val) {
                _obj.setPhoneNo(val);
              },
              deleteFunction: () {
                if (_obj.getPhoneNo().length > 0) {
                  _obj.phoneBack(
                    _obj
                        .getPhoneNo()
                        .substring(0, _obj.getPhoneNo().length - 1),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
