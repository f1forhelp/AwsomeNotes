import 'package:awsomeNotes/providers/phoneProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../dimensions.dart';
import 'keyPad.dart';

class OtpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final obj = Provider.of<PhoneProvider>(context, listen: false);
    print("bui");
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: Dimensions.boxHeight * 5),
                    Align(
                      alignment: Alignment(-1, 0),
                      child: IconButton(
                          icon: Icon(
                            Icons.navigate_before,
                            color: Colors.white,
                            size: Dimensions.boxHeight * 8,
                          ),
                          onPressed: null),
                    ),
                    SizedBox(
                      height: Dimensions.boxHeight * 7,
                    ),
                    Text(
                      "Verification Code",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: Dimensions.boxHeight * 3.2,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.boxHeight * 2,
                    ),
                    Text(
                      "Please type the verification code sent",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: Dimensions.boxHeight * 2.2),
                    ),
                    SizedBox(
                      height: Dimensions.boxHeight * 1,
                    ),
                    Text(
                      "to 9971179377",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: Dimensions.boxHeight * 2.2),
                    ),
                    SizedBox(
                      height: Dimensions.boxHeight * 0.5,
                    ),
                    SizedBox(height: Dimensions.boxHeight * 8),
                    SizedBox(
                      width: Dimensions.boxWidth * 75,
                      child: Selector<PhoneProvider, String>(
                        selector: (context, obj) => obj.getOtp(),
                        builder: (context, data, child) {
                          print(data.length);
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              OtpField(data.length == 0 ? "" : data[0]),
                              OtpField(data.length <= 1 ? "" : data[1]),
                              OtpField(data.length <= 2 ? "" : data[2]),
                              OtpField(data.length <= 3 ? "" : data[3]),
                              OtpField(data.length <= 4 ? "" : data[4]),
                              OtpField(data.length <= 5 ? "" : data[5]),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            KeyPad(
              keyListen: (val) {
                obj.setOtp(val);
              },
              deleteFunction: () {
                if (obj.getOtp().length > 0) {
                  obj.otpBack(
                    obj.getOtp().substring(0, obj.getOtp().length - 1),
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

class OtpField extends StatelessWidget {
  final String val;
  OtpField(this.val);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(0, 0),
      width: Dimensions.boxWidth * 10,
      height: Dimensions.boxHeight * 8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.boxHeight * 1),
        color: Colors.white.withOpacity(0.2),
      ),
      child: Text(
        this.val,
        style: TextStyle(
          color: Colors.white,
          fontSize: Dimensions.boxHeight * 4.5,
        ),
      ),
    );
  }
}
