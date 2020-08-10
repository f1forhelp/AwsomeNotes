import 'package:flutter/material.dart';

class PhoneProvider extends ChangeNotifier {
  String _phoneNo = "";
  String _countryCode = "+91";
  String _subName = "IN";

  String getPhoneNo() {
    if (_phoneNo == null) _phoneNo = "";
    return _phoneNo;
  }

  setPhoneNo(val) {
    if (_phoneNo.length <= 10) _phoneNo = _phoneNo + val;
    notifyListeners();
  }

  setCountryCode(val) {
    _countryCode = val;

    notifyListeners();
  }

  String getCountryCode() {
    return _countryCode;
  }

  setSubName(val) {
    _subName = val;
    notifyListeners();
  }

  String getSubName() {
    return _subName;
  }

  phoneBack(val) {
    _phoneNo = val;
    notifyListeners();
  }
}
