import 'package:awsomeNotes/appUtilities/dimensions.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
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
