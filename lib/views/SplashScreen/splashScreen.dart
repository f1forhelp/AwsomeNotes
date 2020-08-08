import 'package:awsomeNotes/appUtilities/dimensions.dart';
import 'package:awsomeNotes/views/phoneAuthPage/phoneAuthPage.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> nextPage() async {
    await Future.delayed(Duration(seconds: 5));
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PhoneAuthPage(),
      ),
    );
  }

  @override
  void initState() {
    nextPage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Dimensions(context);
    return Material(
      child: Center(
        child: Text(
          "This is Splash Screen",
          style: TextStyle(fontSize: Dimensions.boxHeight * 5),
        ),
      ),
    );
  }
}
