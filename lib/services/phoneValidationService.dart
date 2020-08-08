import 'package:firebase_auth/firebase_auth.dart';

class PhoneValidationService {
  PhoneValidationService._();
  static PhoneValidationService _obj;

  static instance() {
    if (_obj == null) {
      _obj = PhoneValidationService._();
    }
    return _obj;
  }

  String otp;
  String verId;
  String phoneNo;

  _signIn(AuthCredential authCredentials) async {
    await FirebaseAuth.instance.signInWithCredential(authCredentials);
  }

  signInWItOtp(otp) async {
    AuthCredential authCredential = PhoneAuthProvider.getCredential(
        verificationId: this.verId, smsCode: otp);
    await _signIn(authCredential);
  }

  signOut() {
    FirebaseAuth.instance.signOut();
  }

  Future verifyPhone() async {
    final PhoneVerificationCompleted verified =
        (AuthCredential authCredential) {
      print(authCredential.providerId);
      _signIn(authCredential);
      print(1);
    };

    final PhoneVerificationFailed verificationFailed =
        (AuthException authException) {
      print(authException.message);
    };

    final PhoneCodeSent smsSent = (String verId, [int forceResend]) {
      print(2);
    };

    final PhoneCodeAutoRetrievalTimeout autoRetrievalTimeout = (String verId) {
      this.verId = verId;
    };

    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: "+91" + this.phoneNo,
      timeout: const Duration(seconds: 5),
      verificationCompleted: verified,
      verificationFailed: verificationFailed,
      codeSent: smsSent,
      codeAutoRetrievalTimeout: autoRetrievalTimeout,
    );
  }
}
