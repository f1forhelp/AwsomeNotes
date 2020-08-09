import 'package:flutter/cupertino.dart';

class PhoneProvider extends ChangeNotifier {
  String otp;
  String phoneNo;

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

  String getPhoneNo() {
    if (phoneNo == null) phoneNo = "";
    return phoneNo;
  }

  setPhoneNo(val) {
    phoneNo = phoneNo + val;
    notifyListeners();
  }
}
