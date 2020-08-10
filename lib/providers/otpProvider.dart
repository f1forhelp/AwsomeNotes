import 'package:flutter/cupertino.dart';

class OtpProvider extends ChangeNotifier {
  String otp;

  String getOtp() {
    if (otp == null) otp = "";
    return otp;
  }

  setOtp(val) {
    if (otp.length < 6) otp = otp + val;
    notifyListeners();
  }

  otpBack(val) {
    otp = val;
    notifyListeners();
  }
}
